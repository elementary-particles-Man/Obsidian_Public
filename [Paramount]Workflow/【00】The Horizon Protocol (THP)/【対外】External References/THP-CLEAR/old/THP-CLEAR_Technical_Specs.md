## 技術仕様抜粋（E-20準拠）

### 1. 前提

- **フィアット完全準拠**：既存通貨に基づくステーブルコイン（フィアット完全準拠）／E-20互換の決済網を対象（例：JPYC）。
    
- CLEARは**決済そのものを担わない**。**「When / Who / Whom / Coin / Value」** の**真実相当性**のみを保証。
    

### 2. E-20互換性（要点）

- E-20：ステーブルコイン・トークンの**発行体クレジット**と**監査可能性**を前提にする互換ガイドライン（本提言内定義）。
    
- CLEARは**第三者監査レイヤ**として動作し、各決済事業者の主張を**暗号証跡**で裏付け。
    

### 3. 暗号・KMS

- Ed25519署名、TLS/mTLS。
    
- KMS（鍵管理サービス）は **独立した KMS Ring（3台以上／quorum=2）** として動作し、MQ とは別プロセスのクラスタで提供されます。Challenge 段のみフェイルオーバーを許容し、Submit は同一 KMS エンドポイントに固定します（セッションTTL／上限制御）。
    
- 監査ログ：`session_id / kms_endpoint / challenge_latency_ms / submit_latency_ms / challenge_failover_count`。
    

### 4. データレイヤ

- Witness（JSONL+Merkle）→ Materialized（SQLite）
    
- DBは**4TB×2 RAID1（TLC）**、順次書込中心、OP確保・fstrim運用。
    

### 5. 運用

- 監視：Prometheus / Grafana（`kms_*` 指標）。
    
- 交換前提、UPS不要、電源はバッテリ付AC。
    
- 自治体ネット＋東西DCの**ハイブリッド分散**。

### 6. 基準ノード仕様（固定）

- MQ：8GB / NVMe 512GB
- WN：4GB / NVMe 256GB（または下位）
- DB：4GB / SSD 4TB×2 RAID1 TLC
