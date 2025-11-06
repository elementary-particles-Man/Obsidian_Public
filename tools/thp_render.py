#!/usr/bin/env python3
"""Render THP markdown documents to HTML using a minimal renderer."""
import argparse
import datetime as _dt
import html
import re
from pathlib import Path
from typing import List, Tuple, Optional, Dict

TEMPLATE = """<!doctype html><html lang=\"@@LANG@@\"><head><meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"><title>@@TITLE@@</title><link rel=\"stylesheet\" href=\"./style.css\"></head><body><main><header><h1>@@TITLE@@</h1><small class=\"muted\">@@PATH@@ • Render-only / No edits</small></header><section class=\"toc\">@@TOC@@</section><article>@@CONTENT@@</article><footer class=\"hr\"></footer><footer><small class=\"muted\">THP HTML Publish • @@NOW@@ • Commit: insert-by-CI</small></footer></main></body></html>"""

ALLOWED_INLINE_HTML_TAGS = {"br", "span", "sup", "sub", "font", "strong", "em", "u"}

def slugify(text: str) -> str:
    base = re.sub(r"[^0-9A-Za-z\u00C0-\u024F\u4E00-\u9FFF\-\s]", "", text)
    base = base.strip().lower()
    base = re.sub(r"\s+", "-", base)
    if not base:
        base = "section"
    return base


def escape_text(text: str) -> str:
    return text.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")


def protect_inline_html(text: str) -> str:
    result = []
    i = 0
    length = len(text)
    while i < length:
        ch = text[i]
        if ch == "<":
            j = text.find(">", i + 1)
            if j != -1:
                inner = text[i + 1 : j].strip()
                name = ""
                if inner.startswith("/"):
                    name = inner[1:].split(None, 1)[0].lower()
                elif inner:
                    name = inner.split(None, 1)[0].lower()
                if name in ALLOWED_INLINE_HTML_TAGS:
                    result.append(text[i : j + 1])
                    i = j + 1
                    continue
        if ch == "&":
            result.append("&amp;")
        elif ch == "<":
            result.append("&lt;")
        elif ch == ">":
            result.append("&gt;")
        else:
            result.append(html.escape(ch, quote=False))
        i += 1
    return "".join(result)


INLINE_CODE_RE = re.compile(r"`{1,}[^`]*`")
LINK_RE = re.compile(r"!?(\[[^\]]+\]\([^\)]+\))")


def parse_inline(text: str) -> str:
    def replace_code(match: re.Match[str]) -> str:
        segment = match.group(0)
        backtick_count = len(segment) - len(segment.lstrip("`"))
        content = segment[backtick_count:-backtick_count]
        return f"<code>{escape_text(content)}</code>"

    # Temporarily protect code spans
    placeholders: Dict[str, str] = {}
    def stash(value: str, prefix: str) -> str:
        key = f"@@{prefix}{len(placeholders)}@@"
        placeholders[key] = value
        return key

    def protect_codes(s: str) -> str:
        return INLINE_CODE_RE.sub(lambda m: stash(replace_code(m), "CODE"), s)

    working = protect_codes(text)

    # Links and images
    def replace_link(match: re.Match[str]) -> str:
        segment = match.group(0)
        is_image = segment.startswith("!")
        label_start = segment.find("[")
        label_end = segment.find("]", label_start)
        link_start = segment.find("(", label_end)
        link_end = segment.rfind(")")
        label = segment[label_start + 1 : label_end]
        url = segment[link_start + 1 : link_end]
        label_html = parse_inline(label)
        if is_image:
            return f"<img src=\"{escape_text(url)}\" alt=\"{escape_text(label)}\" />"
        title = ""
        if " " in url and not url.strip().startswith("#"):
            url, title = url.split(" ", 1)
            title = title.strip('"')
        attr_title = f" title=\"{escape_text(title)}\"" if title else ""
        return f"<a href=\"{escape_text(url)}\"{attr_title}>{label_html}</a>"

    working = LINK_RE.sub(lambda m: stash(replace_link(m), "LNK"), working)

    # Bold/italic
    def replace_emphasis(s: str) -> str:
        patterns = [
            (re.compile(r"\*\*([^*]+)\*\*"), "strong"),
            (re.compile(r"__([^_]+)__"), "strong"),
            (re.compile(r"\*([^*]+)\*"), "em"),
            (re.compile(r"_([^_]+)_"), "em"),
        ]
        prev = None
        while prev != s:
            prev = s
            for regex, tag in patterns:
                s = regex.sub(lambda m: f"<{tag}>{parse_inline(m.group(1))}</{tag}>", s)
        return s

    working = replace_emphasis(working)

    # Restore placeholders
    result = protect_inline_html(working)
    for key, value in placeholders.items():
        result = result.replace(key, value)
    return result


class MarkdownRenderer:
    def __init__(self) -> None:
        self.id_counts: Dict[str, int] = {}
        self.toc: List[Tuple[int, str, str]] = []

    def heading_id(self, text: str) -> str:
        base = slugify(text)
        count = self.id_counts.get(base, 0)
        if count:
            anchor = f"{base}-{count}"
        else:
            anchor = base
        self.id_counts[base] = count + 1
        return anchor

    def add_to_toc(self, level: int, text: str, anchor: str) -> None:
        if level <= 3:
            self.toc.append((level, text, anchor))

    def render_blocks(self, lines: List[str]) -> Tuple[str, int]:
        html_parts: List[str] = []
        i = 0
        while i < len(lines):
            line = lines[i]
            if not line.strip():
                i += 1
                continue
            if line.startswith("```"):
                fence = line.strip()
                info = fence[3:].strip()
                code_lines: List[str] = []
                i += 1
                while i < len(lines) and not lines[i].startswith("```"):
                    code_lines.append(lines[i])
                    i += 1
                if i < len(lines):
                    i += 1
                code_html = "\n".join(escape_text(cl) for cl in code_lines)
                info_attr = f" data-info=\"{escape_text(info)}\"" if info else ""
                html_parts.append(f"<pre><code{info_attr}>{code_html}</code></pre>")
                continue
            heading_match = re.match(r"^(#{1,6})\s+(.*)$", line)
            if heading_match:
                level = len(heading_match.group(1))
                text = heading_match.group(2).strip()
                anchor = self.heading_id(text)
                self.add_to_toc(level, text, anchor)
                html_parts.append(f"<h{level} id=\"{anchor}\">{parse_inline(text)}</h{level}>")
                i += 1
                continue
            if re.match(r"^\s{0,3}(-{3,}|\*{3,}|_{3,})\s*$", line):
                html_parts.append("<hr />")
                i += 1
                continue
            if line.lstrip().startswith(">"):
                block_lines: List[str] = []
                while i < len(lines) and lines[i].lstrip().startswith(">"):
                    block_lines.append(lines[i].lstrip()[1:].lstrip())
                    i += 1
                inner_html, _ = self.render_blocks(block_lines)
                html_parts.append(f"<blockquote>{inner_html}</blockquote>")
                continue
            table_match = self._match_table(lines, i)
            if table_match:
                table_html, next_index = table_match
                html_parts.append(table_html)
                i = next_index
                continue
            list_match = re.match(r"^(\s*)([-*+]\s+.+)$", line)
            ordered_match = re.match(r"^(\s*)(\d+[.)]\s+.+)$", line)
            if list_match or ordered_match:
                block_html, next_index = self._parse_list(lines, i)
                html_parts.append(block_html)
                i = next_index
                continue
            para_lines: List[str] = []
            while i < len(lines):
                current = lines[i]
                if not current.strip():
                    break
                if current.startswith("```"):
                    break
                if re.match(r"^(#{1,6})\s+", current):
                    break
                if re.match(r"^\s{0,3}(-{3,}|\*{3,}|_{3,})\s*$", current):
                    break
                if current.lstrip().startswith(">"):
                    break
                if self._match_table(lines, i):
                    break
                if re.match(r"^(\s*)([-*+]\s+.+)$", current) or re.match(r"^(\s*)(\d+[.)]\s+.+)$", current):
                    break
                para_lines.append(current)
                i += 1
            paragraph = " ".join(s.strip() for s in para_lines)
            html_parts.append(f"<p>{parse_inline(paragraph)}</p>")
        return "".join(html_parts), len(lines)

    def _match_table(self, lines: List[str], index: int) -> Optional[Tuple[str, int]]:
        if index + 1 >= len(lines):
            return None
        header_line = lines[index]
        if "|" not in header_line:
            return None
        separator_line = lines[index + 1]
        if not re.match(r"^\s*\|?\s*:?[-| :]+:?\s*\|?\s*$", separator_line):
            return None
        rows: List[str] = []
        row_index = index + 2
        while row_index < len(lines):
            row_line = lines[row_index]
            if not row_line.strip() or "|" not in row_line:
                break
            rows.append(row_line)
            row_index += 1
        header_cells = self._split_table_row(header_line)
        alignments = self._parse_alignments(separator_line, len(header_cells))
        body_rows = [self._split_table_row(r) for r in rows]
        table_parts = ["<table>", "<thead><tr>"]
        for idx, cell in enumerate(header_cells):
            align_attr = alignments[idx]
            table_parts.append(f"<th{align_attr}>{parse_inline(cell.strip())}</th>")
        table_parts.append("</tr></thead>")
        if body_rows:
            table_parts.append("<tbody>")
            for row in body_rows:
                table_parts.append("<tr>")
                for idx, cell in enumerate(row):
                    align_attr = alignments[idx]
                    table_parts.append(f"<td{align_attr}>{parse_inline(cell.strip())}</td>")
                table_parts.append("</tr>")
            table_parts.append("</tbody>")
        table_parts.append("</table>")
        return "".join(table_parts), row_index

    def _split_table_row(self, line: str) -> List[str]:
        stripped = line.strip().strip("|")
        cells: List[str] = []
        current: List[str] = []
        inside_tag = False
        inside_code = False
        escape_next = False
        for ch in stripped:
            if escape_next:
                current.append(ch)
                escape_next = False
                continue
            if ch == "\\":
                escape_next = True
                continue
            if ch == "`":
                inside_code = not inside_code
                current.append(ch)
                continue
            if ch == "<" and not inside_code:
                inside_tag = True
            elif ch == ">" and not inside_code:
                inside_tag = False
            if ch == "|" and not inside_tag and not inside_code:
                cells.append("".join(current).strip())
                current = []
            else:
                current.append(ch)
        cells.append("".join(current).strip())
        return cells

    def _parse_alignments(self, line: str, count: int) -> List[str]:
        stripped = line.strip().strip("|")
        segments = [seg.strip() for seg in stripped.split("|")]
        alignments = []
        for seg in segments:
            align = ""
            if seg.startswith(":") and seg.endswith(":"):
                align = " center"
            elif seg.startswith(":"):
                align = " left"
            elif seg.endswith(":"):
                align = " right"
            align_attr = f" align=\"{align.strip()}\"" if align else ""
            alignments.append(align_attr)
        if len(alignments) < count:
            alignments.extend([""] * (count - len(alignments)))
        elif len(alignments) > count:
            alignments = alignments[:count]
        return alignments

    def _parse_list(self, lines: List[str], start_index: int) -> Tuple[str, int]:
        items: List[List[str]] = []
        ordered = False
        index = start_index
        pattern = re.compile(r"^(\s*)([-*+]\s+|\d+[.)]\s+)(.*)$")
        while index < len(lines):
            line = lines[index]
            match = pattern.match(line)
            if not match:
                break
            indent = len(match.group(1).replace("\t", "    "))
            marker = match.group(2)
            marker_len = len(marker)
            content = match.group(3)
            current_ordered = bool(re.match(r"\d", marker.strip()))
            if items and current_ordered != ordered:
                break
            ordered = current_ordered
            index += 1
            item_lines: List[str] = []
            if content:
                item_lines.append(content)
            base_indent = indent + marker_len
            while index < len(lines):
                next_line = lines[index]
                if not next_line.strip():
                    item_lines.append("")
                    index += 1
                    continue
                next_match = pattern.match(next_line)
                if next_match:
                    next_indent = len(next_match.group(1).replace("\t", "    "))
                    if next_indent <= indent:
                        break
                leading_spaces = len(next_line) - len(next_line.lstrip(" "))
                if leading_spaces >= base_indent:
                    trimmed = next_line[base_indent:]
                    item_lines.append(trimmed)
                    index += 1
                else:
                    break
            items.append(item_lines)
        tag = "ol" if ordered else "ul"
        parts = [f"<{tag}>"]
        for item_lines in items:
            if not item_lines:
                parts.append("<li></li>")
                continue
            rendered, _ = self.render_blocks(item_lines)
            parts.append(f"<li>{rendered}</li>")
        parts.append(f"</{tag}>")
        return "".join(parts), index


def build_toc_html(entries: List[Tuple[int, str, str]]) -> str:
    if not entries:
        return "<p>No sections.</p>"
    parts: List[str] = ["<nav>"]
    prev_level = 0
    for level, text, anchor in entries:
        if level > prev_level:
            for _ in range(level - prev_level):
                parts.append("<ul>")
        else:
            for _ in range(prev_level - level):
                parts.append("</li></ul>")
            if prev_level:
                parts.append("</li>")
        parts.append(f"<li><a href=\"#{anchor}\">{parse_inline(text)}</a>")
        prev_level = level
    for _ in range(prev_level, 0, -1):
        parts.append("</li></ul>")
    parts.append("</nav>")
    return "".join(parts)


def render_markdown(path: Path) -> Tuple[str, List[Tuple[int, str, str]]]:
    text = path.read_text(encoding="utf-8")
    lines = text.splitlines()
    renderer = MarkdownRenderer()
    html_content, _ = renderer.render_blocks(lines)
    return html_content, renderer.toc


def main() -> None:
    parser = argparse.ArgumentParser(description="Render THP markdown to HTML.")
    parser.add_argument("source", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("title", type=str)
    parser.add_argument("docpath", type=str)
    parser.add_argument("lang", type=str)
    args = parser.parse_args()

    content_html, toc_entries = render_markdown(args.source)
    toc_html = build_toc_html(toc_entries)
    now = _dt.datetime.utcnow().strftime("%Y-%m-%d %H:%M UTC")
    rendered = TEMPLATE
    rendered = rendered.replace("@@LANG@@", args.lang)
    rendered = rendered.replace("@@TITLE@@", html.escape(args.title))
    rendered = rendered.replace("@@PATH@@", html.escape(args.docpath))
    rendered = rendered.replace("@@TOC@@", toc_html)
    rendered = rendered.replace("@@CONTENT@@", content_html)
    rendered = rendered.replace("@@NOW@@", now)
    args.output.write_text(rendered, encoding="utf-8")


if __name__ == "__main__":
    main()
