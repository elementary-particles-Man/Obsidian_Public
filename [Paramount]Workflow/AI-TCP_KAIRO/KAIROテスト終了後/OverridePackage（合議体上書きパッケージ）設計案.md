- ## 背景
    
    AI‑TCP/KAIRO では、重大なパラメータ変更や高度な意思決定を行う際に、特定のメンバーによる署名多数決（合議制）を必要とする `OverridePackage` を運用する予定です。これは単一の権限に依存するのではなく、複数の責任主体によって安全に値を上書きできる仕組みです。
    
    ## 要件
    
    - **署名多数決:** 合議体メンバー（例えば 5 名中 3 名以上）の署名が揃った場合のみオーバーライドを有効とする。
        
    - **メンバー管理:** メンバーの公開鍵および投票権限を台帳で管理し、必要に応じて追加・削除が行えるようにする。
        
    - **バージョン管理:** オーバーライド前後の値と理由、適用時刻を追跡可能にし、不一致の際はロールバックを可能とする。
        
    
    ## データ構造
    
    rust
    
    コピーする編集する
    
    `use chrono::{DateTime, Utc};  /// OverridePackage は合議による上書き提案を表します pub struct OverridePackage<T> {     pub id: String,                 // 一意な識別子     pub proposed_value: T,          // 提案された新しい値     pub reason: String,             // 上書き理由     pub timestamp: DateTime<Utc>,   // 提案時刻     pub signatures: Vec<Signature>, // 署名のリスト }  /// 合議体メンバー pub struct CouncilMember {     pub id: String,     pub public_key: PublicKey,     pub weight: u8,                 // 投票権重み（デフォルト1） }  /// レジストリはメンバーの一覧を保持します pub struct CouncilRegistry {     pub members: Vec<CouncilMember>,     pub threshold: u8,              // 承認に必要な重み総和 }`
    
    ## 承認アルゴリズム
    
    1. **署名収集:** 提案者は `OverridePackage` に対し自分の署名を付与し、他のメンバーに署名を依頼します。署名には `id`、`proposed_value`、`reason`、`timestamp` のハッシュが含まれます。
        
    2. **署名検証:** 受信者はメンバー台帳を参照し、署名者の公開鍵を用いて各署名を検証します。
        
    3. **重み集計:** 検証に成功した署名の `weight` を合計し、`threshold` 以上になった時点で承認とします。多数決に満たない場合は却下です。
        
    4. **適用:** 承認された `OverridePackage` は既存設定を上書きし、バージョン履歴に記録します。
        
    
    ## 実装上の注意点
    
    - 署名の重複や不正署名を排除するため、`signatures` 内で同じ `CouncilMember` からの署名は 1 つだけ許可します。
        
    - `threshold` は初期設定としてメンバー数の過半数を採用し、台帳更新時には再計算します。
        
    - 将来的に改訂が必要な場合に備え、バージョン履歴を永続化し、旧バージョンへのロールバック機能を整備します。