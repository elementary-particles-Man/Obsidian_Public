このドキュメントでは、AI‑TCP/KAIROプロジェクトにおけるCLI機能の拡張内容および新規追加されたエージェント設定ジェネレーターについて説明します。

## `signed_sender` の拡張

既存の `signed_sender` バイナリに以下のオプションが追加されました：

- `--config <PATH>` – 署名鍵などを含むエージェント設定ファイルのパスを指定します。デフォルトは `agent_config.json` です。
    
- `--fake` – メッセージ送信時に署名を偽装するオプションです。署名検証エラーをトリガーする際に使用します。
    

### 使用例

bash

コピーする編集する

`# 通常の署名付き送信 cargo run --bin signed_sender -- --to 10.0.0.2 --message "Hello" --config agent1_config.json  # 署名を偽装して送信（検証失敗を期待） cargo run --bin signed_sender -- --to 10.0.0.2 --message "Hello" --fake --config agent1_config.json`

## 新バイナリ `agent_config_gen`

`agent_config_gen` は任意のエージェント名を指定して鍵ペアを生成し、署名付き通信に使用するための設定ファイルを出力するツールです。生成される JSON ファイルには公開鍵・秘密鍵および署名フィールドが含まれます（署名フィールドは空文字列で初期化されます）。

### 使用例

bash

コピーする編集する

``# エージェント名 `agent1` の設定ファイルを生成 cargo run --bin agent_config_gen -- agent1 # → agent1_config.json が生成されます``

## Cargo.toml の更新

新しいバイナリ `agent_config_gen` を使用するため、`Cargo.toml` に以下のセクションを追記してください：

toml

コピーする編集する

`[[bin]] name = "agent_config_gen" path = "src/agent/agent_config_gen.rs"`

## テスト方法

1. `agent_config_gen` で設定ファイルを生成。
    
2. `signed_sender` に `--config` オプションで生成した設定ファイルを指定してメッセージを送信。
    
3. `--fake` オプションを付けて送信し、署名検証が失敗することを確認。
    
4. `cargo check --all-targets` で全ターゲットがコンパイルエラーなしにビルドできることを確認。
    

## まとめ

これらの機能拡張によって、エージェント間で署名付き通信を行う際の柔軟性が向上し、特定のエージェント用の設定ファイルを簡単に生成できるようになりました。また、`--fake` オプションにより署名検証ロジックのテストも簡単に行えます。