承知いたしました。

最新のリモートリポジトリの分析に基づき、使用者（事業者・税務署・保守要員）の利便性を最優先とするUIを実現するために必要な、追加API群の実装要求資料を作成します。

これは、API実装を担当するGPT-5（または開発チーム）向けの技術仕様指示書となります。

---

## THP-CLEAR / CLEAR-TAX API追加実装要求仕様書 (v1.0)

宛先: GPT-5 (バックエンドAPI実装担当)

件名: ユーザー利便性（UI）実現のためのCLEAR-TAX API v2拡張実装要求

### 1. 基本方針と設計思想

1. **使用者最優先:** API設計は、事業者・税務署・保守要員のワークフローを最優先とする。UI（Stitch）が最も効率的に機能し、ユーザーが直感的に操作できることを目的とする。計算リソースの制約はゼロとして考慮する。
    
2. **責務の分離 (既存設計の踏襲):**
    
    - `dbe-tax` (既存): 税額**計算エンジン** (`/tax/compute`, `/tax/catalog`) としての責務に特化する。
        
    - `wn-tax` (既存): Peppolインボイスの**送信ワーカー** (`postPeppolInvoiceWithSig`) としての責務に特化する。
        
    - **`clear-api` (今回拡張対象):** これら2つを内包・オーケストレーションし、UIからのリクエストを受け付ける**総合フロントエンドAPI**としての役割を担う。UIが接続するエンドポイントは原則 `clear-api` に集約する。
        
3. **データストア:** `clear-api` は、インボイスの台帳（`InvoiceLedger`）を管理するための専用ストレージ（SQLiteテーブル）を必要とする。
    

### 2. リポジトリ分析と既存APIの確認

- **`openapi/dbe-tax.yaml`**: 税額計算 (`compute`) と税務カタログ (`catalog`) 管理のAPIのみ定義されている。
    
- **`cmd/wn-tax/main.go`**: Peppol送信機能 (`postPeppolInvoiceWithSig`) が存在することを確認。
    
- **`docs_jp/repository_overview_JP.md`**: `clear-api` が主要機能を担う単一バイナリであることが確認された。
    

**結論:** 事業者の利便性（インボイスの作成、下書き保存、送信履歴の確認）と、税務署の利便性（証跡の突合）を満たすためのAPIが**決定的に不足**している。以下のAPI群を `clear-api` に追加実装することを要求する。

---

### 3. 【最優先】ペルソナ別: 追加API実装要求

#### A. 事業者 (Business Operator) 向けAPI群

**目的:** ブラウザ（UI）上でインボイスのライフサイクル（作成・計算・保存・送信・ステータス確認）を完結させる。

##### A-1. インボイス台帳 (CRUD) API

|**エンドポイント**|**メソッド**|**目的 (UIでの使われ方)**|
|---|---|---|
|`POST /api/v1/tax/invoices`|`POST`|**インボイスの新規作成（下書き保存）**<br><br>  <br><br>(UIの「下書き保存」ボタンで使用)|
|`GET /api/v1/tax/invoices`|`GET`|**インボイス一覧の取得（ダッシュボード）**<br><br>  <br><br>(UIのインボイス一覧画面で使用。ページネーション、ステータスでのフィルタ必須)|
|`GET /api/v1/tax/invoices/{invoice_id}`|`GET`|**特定インボイスの詳細取得**<br><br>  <br><br>(UIで一覧から特定のインボイスを選択した際に使用)|
|`PUT /api/v1/tax/invoices/{invoice_id}`|`PUT`|**インボイスの更新（下書き）**<br><br>  <br><br>(既存の下書きを編集して再度保存する際に使用)|
|`DELETE /api/v1/tax/invoices/{invoice_id}`|`DELETE`|**インボイスの削除（下書きのみ）**<br><br>  <br><br>(ステータスが `draft` のもののみ削除可能)|

##### A-2. インボイス・アクション API

|**エンドポイント**|**メソッド**|**目的 (UIでの使われ方)**|
|---|---|---|
|`POST /api/v1/tax/invoices/{invoice_id}/send`|`POST`|**インボイスの送信（Peppol）**<br><br>  <br><br>(UIの「送信」ボタンで使用。内部で `wn-tax` をキックする)|
|`POST /api/v1/tax/invoices/validate`|`POST`|**インボイス税額計算（シミュレーション）**<br><br>  <br><br>(UIの「税額計算」ボタンで使用。内部で `dbe-tax` の `/tax/compute` を呼び出す)|

---

#### B. 税務署 (Tax Auditor) 向けAPI群

**目的:** CLEARの決済証跡 (Witness) と、TAXのインボイス台帳 (Ledger) をシームレスに突合・監査できるようにする。

|**エンドポイント**|**メソッド**|**目的 (UIでの使われ方)**|
|---|---|---|
|`GET /api/v1/audit/search`|`GET`|**統合監査検索**<br><br>  <br><br>(UIの監査用検索ポータルで使用。`?witness_id=...` `?invoice_id=...` `?tx_date=...` 等で検索)|
|`GET /api/v1/audit/verification/{id}`|`GET`|**証跡突合ビュー（最重要）**<br><br>  <br><br>(UIの左右2ペイン画面用。`id` はWitness IDまたはInvoice IDのどちらでも可)|
|`GET /api/v1/clear/witness/{witness_id}`|`GET`|**Witnessログ単体の取得**<br><br>  <br><br>(`clear-api` が自身のDBからWitnessログ詳細を返す)|

---

#### C. 保守要員 (System Operator) 向けAPI群

**目的:** システムの自律性・堅牢性を可視化し、異常（デコイ鍵発行など）を即座に検知可能にする。

|**エンドポイント**|**メソッド**|**目的 (UIでの使われ方)**|
|---|---|---|
|`GET /api/v1/system/health`|`GET`|**システム全体のヘルスチェック**<br><br>  <br><br>(UIの統合ダッシュボードの「ステータスインジケータ」で使用)|
|`GET /api/v1/system/nodes`|`GET`|**クラスタノード一覧の取得**<br><br>  <br><br>(UIの「ノード一覧」テーブルで使用。自動復元中のノードも含む)|
|`GET /api/v1/system/alerts`|`GET`|**異常アラート・フィード**<br><br>  <br><br>(UIの「アラート・フィード」で使用。特にデコイ鍵発行などのセキュリティイベント)|
|`GET /api/v1/tax/catalog/{kind}`|`GET`|**税務カタログのダウンロード (既存)**<br><br>  <br><br>(`dbe-tax` へのプロキシ。保守要員が現在のルールを確認するために使用)|
|`PUT /api/v1/tax/catalog/{kind}`|`PUT`|**税務カタログのアップロード (既存)**<br><br>  <br><br>( `dbe-tax` へのプロキシ。保守要員が税制改正時にルールを更新するために使用)|

---

### 4. 要求スキーマ定義 (主要API抜粋)

API実装の明確化のため、特に重要なデータ構造（JSONスキーマ）を定義する。

#### 4.1. Invoice (データモデル)

インボイス台帳（DBテーブル）が持つべきカラムの定義。

JSON

```
{
  "invoice_id": "string", // UUID (主キー)
  "status": "string", // "draft", "sent", "accepted", "error", "cancelled"
  "issuer_name": "string", // 発行者名 (自社情報)
  "issuer_t_number": "string", // 発行者登録番号 (自社情報)
  "customer_name": "string", // 取引先名
  "customer_peppol_id": "string", // 取引先Peppol ID
  "issue_date": "string", // 発行日 (YYYY-MM-DD)
  "due_date": "string", // 支払期限日 (YYYY-MM-DD)
  "lines": [
    {
      "item_code": "string",
      "description": "string",
      "quantity": "number",
      "unit_price": "number"
    }
  ],
  "tax_summary": { // dbe-tax の /compute 結果を保存
    "net": "number",
    "tax": "number",
    "total": "number",
    "catalog_version_used": "string"
  },
  "linked_witness_id": "string", // (nullable) 紐付けられた決済証跡ID
  "last_sent_at": "string", // (nullable) 最終送信日時
  "error_message": "string" // (nullable) 送信エラー時のメッセージ
}
```

#### 4.2. `POST /api/v1/tax/invoices` (新規作成)

- **Request Body:** 上記 `Invoice` モデルから `invoice_id`, `status`, `tax_summary`, `linked_witness_id` 等を除いた、ユーザー入力部分。
    
- **Response Body (201 Created):** 作成された完全な `Invoice` オブジェクト（`invoice_id` を含む）。
    

#### 4.3. `POST /api/v1/tax/invoices/validate` (税額計算)

- **Request Body:** `dbe-tax.yaml` の `ComputeRequest` と同一で良い。
    
    JSON
    
    ```
    {
      "catalog_version": "latest",
      "lines": [
        { "item_code": "...", "amount": ..., "qty": ... }
      ]
    }
    ```
    
- **Response Body (200 OK):** `dbe-tax.yaml` の `ComputeResult` と同一で良い。
    
    JSON
    
    ```
    {
      "net": ...,
      "tax": ...,
      "total": ...,
      "details": [...]
    }
    ```
    

#### 4.4. `POST /api/v1/tax/invoices/{invoice_id}/send` (送信)

- **Request Body:** (Empty)
    
- **Response Body (202 Accepted):** 送信処理を受け付けたことを示す。`Invoice` オブジェクトのステータスが `sent` に更新される。
    
    JSON
    
    ```
    {
      "invoice_id": "string",
      "status": "sent", // ステータスが "sent" になったことを返す
      "last_sent_at": "string" // 送信日時
    }
    ```
    

#### 4.5. `GET /api/v1/audit/verification/{id}` (証跡突合ビュー)

- **Response Body (200 OK):** UIの2ペイン表示に必要なデータを集約して返す。
    
    JSON
    
    ```
    {
      "verification_status": "VERIFIED", // "VERIFIED", "MISMATCH", "WITNESS_ONLY", "INVOICE_ONLY"
      "witness_log": { // CLEARの決済証跡
        "witness_id": "wit_abc123",
        "timestamp": "...",
        "sender": "...",
        "recipient": "...",
        "amount": 110000
      },
      "tax_invoice": { // TAXのインボイス台帳
        "invoice_id": "inv_xyz789",
        "issue_date": "...",
        "issuer_name": "...",
        "customer_name": "...",
        "total_amount": 110000,
        "tax_summary": { ... }
      }
    }
    ```
    

### 5. 結論

dbe-tax は「計算エンジン」として非常に優秀だが、それ単体ではユーザーの利便性を満たせない。

上記API群を clear-api に実装し、インボイス台帳機能と各種ワーカー（dbe-tax, wn-tax）を適切にオーケストレーションすることによって、初めてStitchで作成するUIが価値を持つ。

計算負荷はゼロとみなし、ユーザーの利便性（レスポンス速度、操作の簡便さ）を最優先とした実装を要求する。