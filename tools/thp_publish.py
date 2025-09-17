#!/usr/bin/env python3
"""Pipeline to render THP markdown files to HTML outputs."""
from __future__ import annotations

import argparse
import datetime as _dt
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List

from thp_render import TEMPLATE, build_toc_html, render_markdown, parse_inline

CSS_CONTENT = """/* THP Readable CSS (minimal) */
:root{--fg:#111;--bg:#fff;--muted:#555;--link:#0b63ce;--accent:#0b63ce;--codebg:#f6f8fa;--border:#e5e7eb;--max:980px}
*{box-sizing:border-box}html{scroll-behavior:smooth}body{margin:0;background:var(--bg);color:var(--fg);font:16px/1.7 system-ui,-apple-system,Segoe UI,Roboto,Helvetica,Arial}
main{max-width:var(--max);margin:2rem auto;padding:0 1.25rem}
header,footer{border-bottom:1px solid var(--border)}header{background:#fff8}
.toc{background:#fafafa;border:1px solid var(--border);padding:1rem;border-radius:10px}
h1{font-size:2rem;margin:1.2rem 0 .6rem}h2{margin:1.2rem 0 .4rem}
a{color:var(--link);text-decoration:none}a:hover{text-decoration:underline}
blockquote{margin:1rem 0;padding:.6rem 1rem;border-left:4px solid var(--accent);background:#fafcff}
pre,code{font-family:ui-monospace,SFMono-Regular,Consolas,monospace}pre{background:var(--codebg);padding:1rem;border-radius:8px;overflow:auto}
table{width:100%;border-collapse:collapse;margin:1rem 0}th,td{border:1px solid var(--border);padding:.5rem;text-align:left}
.hr{height:1px;background:var(--border);margin:1.5rem 0}
.navgrid{display:grid;grid-template-columns:repeat(auto-fill,minmax(260px,1fr));gap:.75rem;margin:1rem 0}
.card{border:1px solid var(--border);border-radius:10px;padding:1rem;background:#fff}
small.muted{color:var(--muted)}"""

ROOT = Path("[Paramount]Workflow/【最重要】The Horizon Protocol (THP)/1st-The Horizon Protocol Seven Documents")


@dataclass
class SourceSpec:
    path: Path
    title: str
    optional: bool = False


@dataclass
class TargetSpec:
    name: str
    base_dir: Path
    output_dir: Path
    language: str
    sources: List[SourceSpec]
    index_title: str
    index_label: str


TARGETS: List[TargetSpec] = [
    TargetSpec(
        name="EN_HTML_BUILD",
        base_dir=ROOT / "English",
        output_dir=ROOT / "English/html",
        language="en",
        index_title="The Horizon Protocol — HTML Edition (English)",
        index_label="THP/English",
        sources=[
            SourceSpec(Path("THP-1 World_Redefinition_Charter.md"), "THP-1 World Redefinition Charter"),
            SourceSpec(Path("THP-2 Ethics_Charter.md"), "THP-2 Ethics Charter"),
            SourceSpec(Path("THP-3 People_Charter.md"), "THP-3 People Charter"),
            SourceSpec(Path("THP-4 Religion_Charter.md"), "THP-4 Religion Charter"),
            SourceSpec(Path("THP-5 Lexicon.md"), "THP-5 Lexicon"),
            SourceSpec(Path("THP-6 Appendix.md"), "THP-6 Appendix"),
            SourceSpec(Path("THP-7 Ops_KPI_Dashboard.md"), "THP-7 Ops/KPI Dashboard"),
            SourceSpec(Path("Supplement/THP-2-S0 E-MAD_Specifications.md"), "THP-2-S0 E-MAD Specifications"),
        ],
    ),
    TargetSpec(
        name="JP_HTML_BUILD",
        base_dir=ROOT / "Japanese",
        output_dir=ROOT / "Japanese/html",
        language="ja",
        index_title="The Horizon Protocol — HTML Edition（日本語）",
        index_label="THP/日本語",
        sources=[
            SourceSpec(Path("THP-1 World_Redefinition_Charter-世界再定義宣言.md"), "THP-1 世界再定義宣言"),
            SourceSpec(Path("THP-2 Ethics_Charter-倫理憲章.md"), "THP-2 倫理憲章"),
            SourceSpec(Path("THP-3 People_Charter-民族憲章.md"), "THP-3 民族憲章"),
            SourceSpec(Path("THP-4 Religion_Charter-宗教憲章.md"), "THP-4 宗教憲章"),
            SourceSpec(Path("THP-5 Lexicon-用語辞書.md"), "THP-5 用語辞書"),
            SourceSpec(Path("THP-6 Appendix-補遺.md"), "THP-6 補遺"),
            SourceSpec(Path("THP-7 Ops_KPI_Dashboard-運用計測基盤.md"), "THP-7 運用計測基盤"),
            SourceSpec(Path("補足資料/THP-2-S0 E-MAD_仕様.md"), "THP-2-S0 E-MAD 仕様", optional=True),
        ],
    ),
]


def write_css(target: TargetSpec) -> None:
    target.output_dir.mkdir(parents=True, exist_ok=True)
    css_path = target.output_dir / "style.css"
    css_path.write_text(CSS_CONTENT, encoding="utf-8")


def replace_template(title: str, toc_html: str, content_html: str, doc_path: str, lang: str) -> str:
    now = _dt.datetime.now(_dt.timezone.utc).strftime("%Y-%m-%d %H:%M UTC")
    rendered = TEMPLATE
    rendered = rendered.replace("@@LANG@@", lang)
    rendered = rendered.replace("@@TITLE@@", title)
    rendered = rendered.replace("@@PATH@@", doc_path)
    rendered = rendered.replace("@@TOC@@", toc_html)
    rendered = rendered.replace("@@CONTENT@@", content_html)
    rendered = rendered.replace("@@NOW@@", now)
    return rendered


def strip_tags(html_text: str) -> str:
    import re
    from html import unescape

    text = re.sub(r"<[^>]+>", " ", html_text)
    text = unescape(text)
    text = re.sub(r"\s+", " ", text)
    return text.strip()


def extract_summary(markdown_path: Path) -> str:
    text = markdown_path.read_text(encoding="utf-8")
    lines = text.splitlines()
    paragraph: List[str] = []
    for line in lines:
        stripped = line.strip()
        if not stripped:
            if paragraph:
                break
            continue
        if stripped.startswith("#"):
            continue
        if stripped.startswith(("- ", "* ", "+ ", "> ", "|")):
            if paragraph:
                break
            continue
        paragraph.append(stripped)
        if len(" ".join(paragraph)) >= 320:
            break
    if not paragraph:
        return "No summary."
    paragraph_text = " ".join(paragraph)
    html_fragment = parse_inline(paragraph_text)
    summary = strip_tags(html_fragment)
    if len(summary) > 320:
        summary = summary[:320].rstrip() + "…"
    return summary


def source_to_output_name(source_path: Path) -> str:
    stem = source_path.stem.replace(" ", "_")
    return f"{stem}.html"


def ensure_render(target: TargetSpec) -> Dict[Path, Path]:
    mapping: Dict[Path, Path] = {}
    base = target.base_dir
    for spec in target.sources:
        src_path = base / spec.path
        if not src_path.exists():
            if spec.optional:
                print(f"[WARN] Optional source missing: {src_path}")
                continue
            raise FileNotFoundError(f"Required source missing: {src_path}")
        out_name = source_to_output_name(src_path)
        out_path = target.output_dir / out_name
        content_html, toc_entries = render_markdown(src_path)
        toc_html = build_toc_html(toc_entries)
        doc_path_display = str(src_path.relative_to(ROOT))
        rendered = replace_template(spec.title, toc_html, content_html, doc_path_display, target.language)
        out_path.write_text(rendered, encoding="utf-8")
        mapping[src_path] = out_path
        print(f"Rendered {src_path} -> {out_path}")
    return mapping


def build_index(target: TargetSpec, mapping: Dict[Path, Path]) -> None:
    cards: List[str] = []
    for spec in target.sources:
        src_path = target.base_dir / spec.path
        out_name = source_to_output_name(src_path)
        if spec.optional and src_path not in mapping:
            continue
        summary = extract_summary(src_path)
        card_html = (
            f"<div class=\"card\"><h3><a href=\"./{out_name}\">{spec.title}</a></h3>"
            f"<p>{summary}</p><small class=\"muted\">{target.index_label}</small></div>"
        )
        cards.append(card_html)
    cards_html = "<div class=\"navgrid\">" + "".join(cards) + "</div>"
    toc_html = "<p>Document index</p>"
    doc_path = str(target.output_dir.relative_to(ROOT)) + "/index.html"
    rendered = replace_template(target.index_title, toc_html, cards_html, doc_path, target.language)
    index_path = target.output_dir / "index.html"
    index_path.write_text(rendered, encoding="utf-8")
    print(f"Index generated: {index_path}")


def check_no_empty(files: List[Path]) -> None:
    for file in files:
        if file.is_file() and file.stat().st_size == 0:
            raise RuntimeError(f"Empty output file detected: {file}")


def check_css_link(files: List[Path]) -> None:
    expected = '<link rel="stylesheet" href="./style.css">'
    for file in files:
        text = file.read_text(encoding="utf-8")
        if expected not in text:
            raise RuntimeError(f"Missing stylesheet link in {file}")


def check_titles(files: List[Path]) -> None:
    for file in files:
        text = file.read_text(encoding="utf-8")
        if "<title>UNKNOWN" in text:
            raise RuntimeError(f"Unknown title placeholder in {file}")


def normalized_markdown_text(path: Path) -> str:
    content_html, _ = render_markdown(path)
    return strip_tags(content_html)


def normalized_output_text(path: Path) -> str:
    text = path.read_text(encoding="utf-8")
    start = text.find("<article>")
    end = text.find("</article>", start)
    if start == -1 or end == -1:
        raise RuntimeError(f"Article tags not found in {path}")
    article_html = text[start:end]
    return strip_tags(article_html)


def check_content_integrity(mapping: Dict[Path, Path]) -> None:
    for src, out in mapping.items():
        src_norm = normalized_markdown_text(src)
        out_norm = normalized_output_text(out)
        if src_norm != out_norm:
            raise RuntimeError(f"Content mismatch detected for {src} vs {out}")


def run_checks(target_mappings: Dict[str, Dict[Path, Path]]) -> None:
    all_files: List[Path] = []
    for mapping in target_mappings.values():
        all_files.extend(mapping.values())
    check_no_empty(all_files)
    check_css_link(all_files)
    check_titles(all_files)
    for mapping in target_mappings.values():
        check_content_integrity(mapping)


def main() -> None:
    parser = argparse.ArgumentParser(description="Publish THP HTML outputs.")
    parser.parse_args()
    target_mappings: Dict[str, Dict[Path, Path]] = {}
    for target in TARGETS:
        print(f"Processing target: {target.name}")
        write_css(target)
        mapping = ensure_render(target)
        target_mappings[target.name] = mapping
        build_index(target, mapping)
    run_checks(target_mappings)
    print("All checks passed.")


if __name__ == "__main__":
    main()
