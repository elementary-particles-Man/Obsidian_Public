## スケールアウト検証（要約）

### 目的

- 国家規模（全世界分散）の**連続稼働監査**を、**1000ノード級**で成立させる設計検証。
    
- **KMS多重化（quorum=2）**と **Challenge-bound セッション固定**の実運用性評価。
    

### 主要結果

- **KMSクォーラム成立**：Challenge段のみフェイルオーバー、Submitは同一KMS固定で安定。
    
- **可観測性**：`kms_challenge_failover_total / kms_submit_retry_total / kms_sessions_in_use` ほか指標を整備。
    
- **冗長性**：ノードは交換前提（UPS不要）。自治体ネット分散＋東西DCで**国家級の停止条件**へ引き上げ。
    
- **性能方針**：RaftはDC内低遅延、自治体ノードは非同期append。P95 500ms 目標。
    

### 推奨構成（抜粋）

- MQ：8GB / NVMe 512GB
    
- WN：4GB / NVMe 256GB（または下位）
    
- DB：4GB / SSD 4TB×2 RAID1 TLC
    

### 運用ドリル

- KMS 1台停止 → failover増分、quorum継続
    
- KMS 2台停止 → quorum failed、監査記録と警報で早期復旧
