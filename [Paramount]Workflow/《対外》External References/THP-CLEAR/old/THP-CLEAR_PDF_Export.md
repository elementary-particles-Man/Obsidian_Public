## PDF出力ガイド

- `pdf-export.yaml` を Pandoc Export（`pandoc --defaults=pdf-export.yaml ...`）に指定して、日本語本文フォントを Noto Sans JP に固定する。
- Obsidian：`設定 → 外観 → フォント` で Interface / Preview を **Noto Sans JP** に設定し、OS側に該当フォントがインストール済みであることを確認する。
- ページ分割は `<div class="page-break"></div>`、Pandoc利用時は `\newpage` へ置換して利用可能。
- 画像ファイルは `./assets/diagrams/thp-clear-architecture.svg` を使用し、Mermaidコードは `assets/diagrams/thp_clear_arch_network.mmd` に保管。
