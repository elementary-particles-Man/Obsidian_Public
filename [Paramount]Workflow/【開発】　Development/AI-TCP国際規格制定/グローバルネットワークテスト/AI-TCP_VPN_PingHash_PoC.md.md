# AI-TCP VPN Ping/Hash PoC 証跡

---

## 📌 概要

このファイルは、  
AI-TCP 開発の中でも **最大の物理ネットワーク課題**  
「ローカルネット外からの安全なAI-TCPクライアント → LLMサーバ直結通信」  
が、**VPN仮想IP (Tailnet) を使って5G経由で正常に動作した証拠** を示す。

---

## ✅ 実施内容

- **サーバ側**  
  - LM Studio 等の LLM サーバを VPN仮想IP (例：100.79.x.x) で待機。

- **クライアント側**  
  - Termux 上の Python スクリプト `cli_ping_hash_loop.py`
  - WiFi を切り 5Gモバイル回線のみで接続。
  - 同じ Tailnet 内で VPN仮想IP に Ping/Hash を投げる。

---

## ✅ ログのポイント

```plaintext
🔄 Ping with Hash #1
✅ {'timestamp_content': '20240126T143512.897234', 'hash': '36c5...'}
...
❌ Error: HTTPConnectionPool(host='100.79.100.11', port=1234): Max retries exceeded ...
...
🔄 Ping with Hash #3
✅ {'timestamp_content': '20240701T123456.789Z', 'hash': '5e3e...'}
