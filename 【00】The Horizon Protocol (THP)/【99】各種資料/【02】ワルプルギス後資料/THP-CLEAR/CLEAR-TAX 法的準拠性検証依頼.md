# 新規税務システム「CLEAR-TAX」の適格請求書等保存方式への法務・コンプライアンス準拠性に関する検証報告書

## 第0部：エグゼクティブ・サマリーおよび総合リスク評価

本報告書は、貴部門より依頼のあった新規税務システム「CLEAR-TAX」の設計仕様について、日本の現行消費税法、電子帳簿保存法、および関連するデジタル庁の技術標準との準拠性を検証し、潜在的な法的リスクを分析するものである。

### 0.1. 検証結果の概要

詳細な分析（第1部〜第3部）の結果、以下の主要なリスクが特定された。

1. **論点1（税額計算ロジック）:** **重大な法的リスクを内包する可能性。** 添付資料 `openapi/dbe-tax.yaml` が示唆する税額計算ロジック、特に端数処理の仕様が、国税庁の厳格な要求事項（「一の適格請求書につき、税率ごとに1回」の端数処理） に準拠していない場合、本システムが生成する全ての適格請求書が法的に無効と判断されるリスクがある。   
    
2. **論点2（Peppol/JP PINT連携）:** **中程度のリスク。** `cmd/wn-tax/main.go` が準拠すべきは、UBL 2.1の一般仕様ではなく、デジタル庁が定める日本固有のCIUS（Core Invoice Usage Specification）である「JP PINT」 である。現行の実装がこの厳格なサブセット（最新版 Ver. 1.1.1） に準拠しているか、また将来の仕様更新に追従可能かという点に技術的・法的な懸念が残る。   
    
3. **論点3（証跡連携・電子帳簿保存法）:** **高リスク（ただし設計の解釈による）。** `THP_CLEAR_TAX_Roadmap.md` に記載の「双方向同期」という用語が、もし「決済証跡（Witness）と税務台帳（Ledger）間の可変的なデータ上書き」を許容する設計である場合、電子帳簿保存法（電帳法）が定める「真実性の確保」（例：訂正削除履歴の具備、または訂正削除の防止）の要件を根本から満たさない。   
    

### 0.2. 総合リスク評価

総合リスク評価は「**要注意（Significant Risk Identified）**」とする。

現行の仕様・設計の解釈によっては、税務コンプライアンス上の重大な不備を抱えたままシステムが稼働する可能性が排除できない。特に論点1（税額計算）および論点3（電帳法対応）は、本システムの利用企業（インボイス発行事業者）のみならず、その取引先（インボイス受領事業者）における仕入税額控除の否認、ひいては国税当局による追徴課税や取引先からの損害賠償請求の直接的な原因となり得る。

### 0.3. 必須対応事項（要約）

システムの適法性を担保し、ローンチを可能とするために、以下の対応を強く勧告する。

1. `POST /tax/compute` APIの端数処理ロジックが、国税庁の指針に基づき、「割戻し計算」または「積上げ計算」のいずれかをインボイス単位で統一的に適用し、かつ「税率ごとの合計額」に対して実行されることをコードレベルで担保すること。   
    
2. `cmd/wn-tax/main.go` が生成するXMLが、デジタル庁の最新仕様「JP PINT Ver. 1.1.1」 の検証スキーマ（Schematron）を完全にパスすることをエビデンスとして提出すること。   
    
3. 「双方向同期」のアーキテクチャを、「証跡（Witness）の不変性（Immutability）」と「台帳（Ledger）の追記・訂正履歴の具備」を保証する「**関連性連携（Associative Linkage）**」モデルとして法的に再定義すること。   
    

---

## 第1部：税額計算ロジック（`openapi/dbe-tax.yaml`）の消費税法準拠性検証

本セクションでは、`POST /tax/compute` エンドポイントが担う税額計算ロジックについて、消費税法および関連通達の観点から詳細な法的検証を行う。

### 1.1. 法的要件：消費税法第57条の4と「税率ごとに区分した消費税額等」

消費税法第57条の4第1項は、適格請求書（インボイス）に記載すべき必須事項を定義している。本検証において最も重要なのは、同項第5号に規定される「**税率ごとに区分した消費税額等**」である。   

この「消費税額等」は、単なる参考値や概算値ではなく、法的に厳密な計算プロセスを経て算出された値でなければならない。国税庁の指針によれば、この「消費税額等」の算出における端数処理には厳格なルールが存在する。   

### 1.2. 最重要リスク分析：国税庁が定める「端数処理」ロジックの適法性

国税庁の公式見解は明確である。「一の適格請求書につき、税率の異なるごとに区分した消費税額等に１円未満の端数がある場合には、その端数を処理する」とされている。   

これは、端数処理が「**1インボイスにつき税率ごとに1回**」のみ許可されることを意味する。は続けて、「個々の商品やサービスごとに消費税額を計算し、その都度端数処理を行うことは認められません」と断言しており、これが原則的な禁止事項である。   

この原則を「CLEAR-TAX」のAPI実装（`dbe-tax.yaml`）に当てはめた場合、以下のリスクが想定される。

- **違法となる可能性のある実装（例：商品明細ごとの端数処理）:** APIが `List<LineItem>` を受け取り、各LineItemの税額を計算・端数処理（例：切り捨て）し、最後にそれらを合計して「消費税額等」として返すロジック。
    
    - `Line1 (999円, 10%)` → `Tax: 99.9円` → `99円 (切り捨て)`
        
    - `Line2 (999円, 10%)` → `Tax: 99.9円` → `99円 (切り捨て)`
        
    - **`Total Tax (Invoice): 99 + 99 = 198円`**
        
- **適法な実装（例：税率ごと合計額の端数処理）:** APIが `List<LineItem>` を受け取り、税率ごと（例：10%）の課税標準額（税抜）を_合計_し、その合計額に対して税率を乗じ、_1回だけ_端数処理を行うロジック。
    
    - `Line1 (999円, 10%)`
        
    - `Line2 (999円, 10%)`
        
    - `Total Base (10%): 999 + 999 = 1998円`
        
    - `Tax: 1998 * 10% = 199.8円`
        
    - **`Total Tax (Invoice): 199.8円` → `200円 (切り上げ)` または `199円 (切り捨て)`** （※注：最終的な端数処理の方法（切り上げ、切り捨て、四捨五入）は事業者の任意）   
        

上記2例では、同一の取引内容にもかかわらず、計算ロジックの違いによって最終的な「消費税額等」に 1〜2円の差異が生じる。前者の（違法な）ロジックを採用した場合、そのインボイスは法第57条の4の要件を満たさないものとなる。   

### 1.3. 「積上げ計算」の特例と潜在的リスク

インボイス制度の計算ルールには「割戻し計算」（上記1.2の適法例）の他に、「積上げ計算」と呼ばれる方式も例外的に認められている。   

この「積上げ計算」は、国税庁のQ&A（問82など）によれば、各商品明細の税額を算出し（この時点での端数処理は許容される）、それらを_合計した金額_をインボイス記載の「消費税額等」とする方法である。この方法は、一見すると1.2の「違法な実装例」と類似しているため、開発者が誤読するリスクが極めて高い。

しかし、最大の法的リスクは、`POST /tax/compute` APIが、`tax_catalog`（CSV仕様）で定義された商品マスタの設定に基づき、**1枚のインボイス内で「割戻し計算」と「積上げ計算」のルールを混在**させてしまうことである。

適格請求書は、発行するインボイス単位で「割戻し計算」を採用するのか、「積上げ計算」を採用するのかを_いずれか一つに選択_し、そのインボイス全体（または少なくとも同一税率内）で統一的に適用しなければならない。`dbe-tax.yaml` のAPI設計が、インボイス単位でどちらの計算方式を採用するのかを明示的に指定または強制するパラメータを持たない場合、法的に極めて脆弱な実装となる。

### 1.4. 税額計算エラーが引き起こす連鎖的な法的責任

もし `POST /tax/compute` が1円でも誤った（＝法的に認められない方法で計算された）「消費税額等」を返した場合、それは単なるシステムバグでは済まされない。

1. 「CLEAR-TAX」は、この誤った税額が記載されたインボイス（Peppolデータ）を生成・送信する。
    
2. このインボイスを受領した取引先（買手）は、そのインボイスに基づき仕入税額控除を申請する。
    
3. 後の税務調査において、買手は「当該インボイスは適格請求書の記載要件を満たさない」として、仕入税額控除を否認される。   
    
4. 買手は、控除を否認されたことによる損害（追徴課税、延滞税等）について、インボイス発行者（「CLEAR-TAX」のユーザー企業）およびシステム提供者（貴社）に対して、債務不履行または不法行為に基づく損害賠償請求を行う可能性がある。
    

このように、税額計算ロジックの根本的な不備は、システムが自動化する全取引において、指数関数的に法的債務を積み上げる時限爆弾となり得る。

### 1.5. 検証結果と法的見解（第1部）

- **見解:** `openapi/dbe-tax.yaml` が「割戻し計算」と「積上げ計算」のどちらを実装しているか、または両方を許容しているか不明瞭である。`tax_catalog`（CSV仕様）との連携が、商品ごとに計算方式を混在させるリスクを内包している。
    
- **勧告:**
    
    1. `POST /tax/compute` APIのエンドポイントまたはリクエストボディにおいて、当該インボイス全体に適用する計算方式（例：`CalculationMethod: "Total_Base_Rounding" | "Line_Item_Rounding"`）を明示的に指定させる仕様に変更すること。
        
    2. 「積上げ計算」を採用する場合は、国税庁QAで認められている計算ロジック（例：税抜金額の積上げか、税込金額の積上げか）を明確にし、明細ごとの端数処理ルール（切り捨て、切り上げ、四捨五入）をインボイス内で統一すること。
        

---

## 第2部：Peppol/JP PINT連携（`cmd/wn-tax/main.go`）の標準仕様準拠性検証

本セクションでは、`cmd/wn-tax/main.go` が実装すると想定される「Peppol署名付き送信」プロセスについて、デジタル庁が定める標準仕様「JP PINT」との準拠性を検証する。

### 2.1. 法的・技術的要件：デジタル庁「JP PINT」標準仕様

Peppolは電子インボイスの国際的な標準規格であるが、各国は自国の税法（例：日本の消費税法）に適合させるため、その「国内標準仕様（CIUS - Core Invoice Usage Specification）」を定めている。   

日本においては、デジタル庁がその標準仕様として「JP PINT」を策定・公表している。最新版は「Peppol BIS Standard Invoice JP PINT Ver. 1.1.1」（2025年5月28日公表）である。   

したがって、`cmd/wn-tax/main.go` が技術的に準拠すべきは、ベースとなっている「UBL-Invoice-2.1」の一般仕様ではなく、JP PINT Ver. 1.1.1が定める、**より厳格な日本のビジネスルールを反映したサブセット**である。これには、特定のXMLフィールドの必須化（Mandatory）、使用可能なコードリストの限定、日本固有の項目（例：適格請求書発行事業者の登録番号）の正しいマッピングが含まれる。   

### 2.2. 「UBL準拠」と「JP PINT準拠」の致命的な差異

開発チームが「UBL-Invoice-2.1に準拠している」と主張しても、それだけでは「JP PINT準拠」とはみなされない。この認識の乖離は、システム間のデータ連携において致命的な障害を生む。

`cmd/wn-tax/main.go` は、Go言語の構造体（Struct）をXML（UBL）にマーシャリング（変換）するロジックであると推察される。ここで、以下のようなシナリオが想定される。

1. UBL 2.1の一般仕様では、`Invoice/PaymentTerms/Note` （支払条件の記述）はオプション（任意）のフィールドであるとする。
    
2. しかし、JP PINTの仕様書が「日本の商慣習上、支払条件の記述は必須」として、このフィールドを必須（Mandatory）と定義している可能性がある（_これは準拠性の差異を説明するための仮定例である_）。
    
3. もし `cmd/wn-tax/main.go` がこのフィールドを（UBLの定義に基づき）オプションとして扱い、対応するGo構造体のフィールドが空（nil）の場合にXMLタグ自体を省略して生成する。
    
4. この生成されたXMLは、JP PINTの検証（Schematron）において「必須フィールド欠落」エラーとなる。
    

JP PINT非準拠のインボイスは、Peppolネットワーク上で受信側アクセスポイントによって拒否されるか、または受信側システム（例：会計ソフト）が正しく解釈できない。これは法的に「適格請求書の交付」義務を果たしたことにならず、第1部で詳述した仕入税額控除の否認リスクを再び招くことになる。   

### 2.3. JP PINTの「バージョン」がもたらす継続的コンプライアンス債務

が示す「2025年5月28日 Ver. 1.1.1に更新・公表」という事実は、JP PINTが静的な規格ではなく、**税制改正や商慣習の変化に伴い更新され続ける動的な規格**であることを示している。   

`cmd/wn-tax/main.go` が、現時点（Ver. 1.1.1）の仕様に完璧に準拠するようハードコードされて開発されている場合、潜在的な保守リスクを抱える。デジタル庁が2026年に税制改正（例：新たな税区分の導入）を反映し、「JP PINT Ver. 1.2.0」を公表した場合、`cmd/wn-tax/main.go` が自動的にVer. 1.2.0に対応できる設計（例：仕様を外部定義ファイルで管理している、スキーマ駆動型である）になっていなければ、Ver. 1.2.0が必須化された瞬間、「CLEAR-TAX」はシステム全体が法的コンプライアンス違反となる。

この検証は、現行バージョンへの準拠性だけでなく、将来のバージョンアップに対する**技術的保守性・拡張性**の観点からも法務レビューが行われなければならない。

### 2.4. 検証結果と法的見解（第2部）

- **見解:** `cmd/wn-tax/main.go` のファイルパスのみでは、JP PINT固有のビジネルール（CIUS）への準拠性、およびバージョン管理への対応が確認できない。
    
- **勧告:**
    
    1. `cmd/wn-tax/main.go` が生成したXML出力サンプル（複数パターン）を、デジタル庁が提供する「JP PINT Ver. 1.1.1」の公式バリデータ（検証ツール）にかけ、全てのテストケースでパスすることを証明するエビデンスを提出すること。
        
    2. JP PINTの仕様が更新された場合の、`cmd/wn-tax` への反映プロセス（仕様の監視体制、開発、デプロイのSLA）を定義し、文書化すること。   
        

---

## 第3部：証跡連携設計（`THP_CLEAR_TAX_Roadmap.md`）の電子帳簿保存法準拠性検証

本セクションでは、`docs/THP_CLEAR_TAX_Roadmap.md` に記載された「CLEAR Witness（決済証跡） ↔ TAX Ledger（税務台帳） 双方向同期」の設計について、電子帳簿保存法（電帳法）の要件、特に「真実性の確保」と「可視性の確保」の観点から法的解釈を行う。

### 3.1. 法的要件（背景）：電子データ保存の完全義務化

令和3年度税制改正における最大の変更点は、電子取引データの「出力書面等による保存措置の廃止」である。   

「CLEAR-TAX」が生成・送受信する電子インボイス（Peppolデータ）や、その基となる決済証跡（Witness）は、すべて電帳法上の「電子取引データ」に該当する。したがって、これらを電子データのまま、電帳法の要件を満たして保存することは、**任意ではなく法律上の義務**である。

### 3.2. 法的要件（A）：「真実性の確保」の4措置

電帳法が要求する「真実性の確保」とは、保存された電子データが、作成時から一貫して改ざんされていないことを証明可能であること（＝非改ざん性の証明）を指す。   

国税庁は、この要件を満たすために、以下の**いずれか**の措置を講じることを要求している。   

1. タイムスタンプが付与されたデータを受領する
    
2. データ保存時に（認定）タイムスタンプを付与する
    
3. **訂正・削除の履歴が残る、または訂正・削除ができないシステム**でデータを授受及び保存する
    
4. 不当な改ざん防止のための事務処理規程を策定し、遵守する
    

「税務事務の完全自動化」を謳う高度なシステムである「CLEAR-TAX」が、最も脆弱な措置4（事務処理規程＝人為的な運用ルール）に依存することは、システムの設計思想と矛盾する。したがって、**措置3（システム的担保）**を主軸とし、必要に応じて措置2（タイムスタンプ）を補完的に採用するのが、法的にも技術的にも最適解である。

### 3.3. 法的要件（B）：「可視性の確保」

「可視性の確保」とは、保存されたデータを、税務調査官等の要求に応じて即座に提示できる状態を指す。本件の設計に特に関連する要件は以下の2点である。

1. **検索機能の要件:** 保存されたデータを、「**取引年月日その他の日付・取引金額・取引先**」の3項目で検索できる必要がある。   
    
2. **「相互関連性の確保」:** によれば、これは「国税関係帳簿間の関連性を確認できる情報を記録すること」を求めるものである。本件の「Witness ↔ Ledger」の設計に直結し、決済証跡（Witness）と、それに基づき起票された税務台帳（Ledger）が、システム上で**相互にリンク**しており、片方からもう片方を容易に呼び出せる状態を指す。   
    

### 3.4. 「双方向同期」という用語の致命的な法的リスク

`Roadmap.md` に記載された「**双方向同期（Bi-directional Sync）**」という技術用語は、電帳法の「真実性の確保」の観点から、最悪の法的解釈を招く可能性がある。

技術分野において、「同期（Sync）」とは一般的に「2つのデータストア（AとB）の状態を同一に保つ」ことを意味する。「双方向（Bi-directional）」とは、Aの変更がBに反映され、_かつ_、Bの変更がAに反映されることを意味する。

これを「CLEAR Witness（A） ↔ TAX Ledger（B）」の設計に当てはめてシミュレートする。

1. _シナリオ:_ 経理担当者が「TAX Ledger（B）」側で「この取引は間違いだった」として、金額を修正（またはレコードを削除）したとする。
    
2. _「双方向同期」の動作:_ システムがこの（B）の変更を検知し、データストア（A）の状態を（B）と同一に保つため、大元の「CLEAR Witness（決済証跡）（A）」のデータを_修正（上書き）_または_削除_する。
    
3. _法的帰結:_ この動作は、電子取引の_元データ（証跡）_を_事後的に改ざん_（または消去）したことに他ならない。これは、電帳法の「真実性の確保」の要件（措置3：訂正削除_履歴_、または訂正削除_不可_）を根本的に破壊する行為である。これは「訂正」ではなく、積極的な「証拠隠滅」と解釈されかねない、極めて重大なコンプライアンス違反である。   
    

結論として、「双方向同期」がもし「双方向_上書き_」を意味するならば、その設計は_即座に_中止されなければならない。

### 3.5. リスク回避のための法的再解釈：「双方向同期」から「双方向関連付け」へ

「CLEAR-TAX」の設計思想（証跡と台帳の連携）を尊重しつつ法的に準拠させるため、当該機能は「**双方向の関連性確保（Bi-directional Associativity）**」として厳密に再定義すべきである。

- **あるべきアーキテクチャ:**
    
    1. **Witness（証跡）の不変性（Immutability）:** 「CLEAR Witness」は決済が実行された（または受信した）時点の_元データ_であり、技術的に**変更・削除が一切不可能**（Write-Once, Read-Many）でなければならない。これが電帳法 措置3の「訂正削除ができないシステム」に該当する。   
        
    2. **Ledger（台帳）の追記性（Append-Only）:** 「TAX Ledger」はWitnessを参照して作成される。もしLedgerに修正が必要な場合、元のレコードを_上書き_するのではなく、**修正履歴（仕訳ジャーナル）を追記**し、新旧のレコードが共に保存され、関連付けられなければならない。これが措置3の「訂正削除の履歴が残る」に該当する。   
        
    3. **相互関連性（Associativity）:** Witnessレコードは、自身を参照するLedgerレコードのIDを_関連情報_として保持する。Ledgerレコードは、元となったWitnessレコードのIDを_必須情報_として保持する。
        

この設計であれば、「WitnessからLedgerを辿る」「LedgerからWitness（元証跡）を辿る」という双方向の_ナビゲーション_（＝同期ではなく関連付け）が可能となり、「可視性」の「相互関連性」の要件を満たし、かつ「真実性」も担保される。   

### 3.6. 電子帳簿保存法 コンプライアンス・マトリクス（Table 1）

抽象的な法要件と具体的なシステム機能の間のギャップを埋め、リスクを可視化するため、以下のコンプライアンス・マトリクスを提示する。

**Table 1: 電子帳簿保存法（電子取引）コンプライアンス・マトリクス**

|法的要件（根拠法規）|要件の具体的内容|「CLEAR-TAX」における対応機能|準拠状況（評価）|必須となる法的・技術的勧告|
|---|---|---|---|---|
|**真実性の確保** (電帳法施行規則 第4条第1項第1号)|訂正削除ができないシステム（または履歴が残るシステム）|「CLEAR Witness」のデータモデル<br><br>  <br><br>「TAX Ledger」のバージョン管理|**高リスク**<br><br>  <br><br>(「双方向同期」の定義による)|1. Witnessの「不変性（Immutable）」をアーキテクチャレベルで保証すること。<br><br>  <br><br>2. Ledgerの変更は「追記（Append-Only）」または「バージョン管理」とし、上書きを禁止すること。|
|**真実性の確保** (電帳法施行規則 第4条第1項第2号)|タイムスタンプ付与|（`Roadmap.md`に記載なし）|**ギャップ**|オプション：不変性が担保できない場合、またはJIIMA認証[9]等の高度な保証を目指す場合、認定タイムスタンプの付与を検討。|
|**可視性の確保** (電帳法施行規則 第4条第1項第4号)|**相互関連性**|「Witness ↔ Ledger 双方向同期」|**中リスク**<br><br>  <br><br>(同期が「関連付け」を意味するなら充足)|1. 同期ロジックを「双方向関連付け」として再定義すること。<br><br>  <br><br>2. WitnessとLedgerの各DBスキーマに、相互の主キー（ID）を保持するFK（外部キー）カラムを必須で設けること。|
|**可視性の確保** (電帳法施行規則 第4条第1項第5号)|**検索機能**|（`Roadmap.md`に記載なし）|**ギャップ**|1. 「日付」「金額」「取引先」の3項目による検索機能をUIに実装すること。<br><br>  <br><br>2. 検索対象はWitnessとLedgerを横断的（または関連付けて）検索できること。|
|**可視性の確保** (電帳法施行規則 第4条第1項第5号)|ディスプレイ・プリンタの備付|（システム外要件）|N/A|（導入企業側の要件としてドキュメント化）|

  

### 3.7. 検証結果と法的見解（第3部）

- **見解:** `Roadmap.md` に記載の「双方向同期」設計は、現状の文言のままでは電帳法における「真実性の確保」の要件と_正面から衝突_する、極めて重大な法的リスクを内包している。   
    
- **勧告:**
    
    1. 上記3.5の「双方向関連付け」モデルに基づき、システムアーキテクチャを再設計または再定義すること。
        
    2. `Roadmap.md` および関連する設計文書から「同期（Sync）」という用語を排除し、「関連付け（Associativity）」または「連携（Linkage）」といった法的実態に即した用語に修正すること。
        
    3. 上記Table 1で「ギャップ」とされた検索機能を、システムの必須要件として開発スコープに追加すること。   
        

---

## 第4部：総論および最終法的リスク評価

### 4.1. 検出された主要リスクの要約

本検証により、`CLEAR-TAX` システムのローンチ前に解決すべき、以下の4点の主要リスクが特定された。

- ** 税額計算ロジックの不適合（第1部）:** 国税庁の端数処理ルール（割戻し or 積上げのインボイス単位での統一）に準拠しないAPIは、システムが生成するインボイスの法的有効性を根本から失わせる。   
    
- ** 電帳法「真実性」の毀損（第3部）:** 「双方向同期」が元証跡（Witness）の上書きを許可する設計である場合、システム自体が法的証拠の改ざんツールとなり得、電帳法に明確に違反する。   
    
- ** JP PINTのバージョン追従不備（第2部）:** デジタル庁の標準仕様の更新に対応できない静的な実装は、将来的なコンプライアンス違反（＝無効な電子インボイスの送信）を不可避とする。   
    
- ** 電帳法「可視性」の欠如（第3部）:** 「相互関連性」の設計不備、および「検索機能」（日付・金額・取引先）の欠如は、それ自体が電帳法の保存義務違反とみなされる。   
    

### 4.2. 「CLEAR-TAX」のローンチに向けた必須対応事項（法的観点から）

上記リスクを軽減し、システムの適法性を確保するため、以下の4項目を必須の対応事項として勧告する。

1. **** `dbe-tax.yaml` のロジックを、国税庁QAに準拠した「税率ごと端数処理（割戻し）」または「明細ごと端数処理（積上げ）」の_いずれかを明確に選択・統一_する仕様に修正する。
    
2. **** 「Witness」の不変性（Immutable）と「Ledger」の訂正履歴具備をアーキテクチャの前提とし、「双方向同期」の定義を「双方向関連付け」に修正する。   
    
3. **** `cmd/wn-tax/main.go` の出力がJP PINT Ver. 1.1.1バリデータをパスすることを証明し、将来のバージョンアップへの保守プロセスを確立する。   
    
4. **** 電帳法が要求する検索機能（日付・金額・取引先）を実装する。   
    

### 4.3. 免責事項

本報告書は、貴殿より提示された限定的な資料（`openapi.yaml`, `.go`, `.md`のファイル名と概要）および当方が収集した公開情報に基づき作成されたものであり、現時点での当方の法的見解を示すものである。実際のコードベースの全貌、インフラストラクチャ、または未提示の内部仕様によっては、本評価が変更される可能性がある。本報告書は、法的な助言（Legal Advice）を構成するものではなく、貴社の最終的な意思決定における判断材料の一つとして提供されるものである。   

[

![](https://t3.gstatic.com/faviconV2?url=https://media.invoice.ne.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

media.invoice.ne.jp

インボイスの請求書、端数処理は商品ごと？計算ルールや国税庁の ...

新しいウィンドウで開く](https://media.invoice.ne.jp/column/invoices/invoice-rounding-per-item.html)[

![](https://t2.gstatic.com/faviconV2?url=https://www.zeiken.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

zeiken.co.jp

デジタル庁 電子インボイスの日本標準仕様「JP PINT」に更新 - 税務研究会

新しいウィンドウで開く](https://www.zeiken.co.jp/zeimutusin/article/no3703/TA00037030901.php)[

![](https://t0.gstatic.com/faviconV2?url=https://www.digital.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

digital.go.jp

JP PINT｜デジタル庁

新しいウィンドウで開く](https://www.digital.go.jp/policies/electronic_invoice)[

![](https://t0.gstatic.com/faviconV2?url=https://jdtf.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jdtf.or.jp

電子取引データ保存のポイント ～真実性の確保の要件を中心に～

新しいウィンドウで開く](https://jdtf.or.jp/news/2025/pdf/0220/1_KeyNote_NTA.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www.nta.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

nta.go.jp

消費税の仕入税額控除制度における適格請求書等保存方式に関する ...

新しいウィンドウで開く](https://www.nta.go.jp/law/tsutatsu/kobetsu/kansetsu/20180606/index.htm)[

![](https://t3.gstatic.com/faviconV2?url=https://www.nichizeiren.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

nichizeiren.or.jp

インボイスの端数処理ルールと記載例について

新しいウィンドウで開く](https://www.nichizeiren.or.jp/wp-content/uploads/invoice/invoice4b.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www.canon-its.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

canon-its.co.jp

電子インボイスの標準仕様「Peppol（ペポル）」とは？経理業務におけるメリットやシステム導入時の注意点：会計・人事給与システム SuperStream（スーパーストリーム） - キヤノンITソリューションズ

新しいウィンドウで開く](https://www.canon-its.co.jp/solution/industry/cross-industry/superstream/column/article/w-peppol-m)[

![](https://t0.gstatic.com/faviconV2?url=https://www.denshichoubohozon.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

denshichoubohozon.com

新しいウィンドウで開く](https://www.denshichoubohozon.com/special/consultant_column1_2.html#:~:text=%E5%B8%B3%E7%B0%BF%E9%96%93%E3%81%AE%E7%9B%B8%E4%BA%92%E9%96%A2%E9%80%A3%E6%80%A7%E3%81%AE%E7%A2%BA%E4%BF%9D%E8%A6%81%E4%BB%B6%E3%81%AF,%E3%81%AB%E3%82%82%E9%81%A9%E7%94%A8%E3%81%95%E3%82%8C%E3%81%BE%E3%81%99%E3%80%82)[

![](https://t0.gstatic.com/faviconV2?url=https://www.fastaccounting.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

fastaccounting.jp

速報「令和３年度・電子帳簿等保存制度の見直し」電子帳簿保存法Ｑ＆Ａ（一問一答）等が公開されました！ - ファーストアカウンティング

新しいウィンドウで開く](https://www.fastaccounting.jp/blog/20210719/6625/)

![](https://www.gstatic.com/lamda/images/immersives/google_logo_icon_2380fba942c84387f09cf.svg)

[![](https://t0.gstatic.com/faviconV2?url=https://www.nta.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

](https://www.nta.go.jp/law/tsutatsu/kobetsu/kansetsu/20180606/index.htm)[![](https://t3.gstatic.com/faviconV2?url=https://media.invoice.ne.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

](https://media.invoice.ne.jp/column/invoices/invoice-rounding-per-item.html)[![](https://t2.gstatic.com/faviconV2?url=https://www.zeiken.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

](https://www.zeiken.co.jp/zeimutusin/article/no3703/TA00037030901.php)[![](https://t0.gstatic.com/faviconV2?url=https://jdtf.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

](https://jdtf.or.jp/news/2025/pdf/0220/1_KeyNote_NTA.pdf)

![](https://www.gstatic.com/lamda/images/immersives/google_logo_icon_2380fba942c84387f09cf.svg)

[![](https://t3.gstatic.com/faviconV2?url=https://media.invoice.ne.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

](https://media.invoice.ne.jp/column/invoices/invoice-rounding-per-item.html)[![](https://t0.gstatic.com/faviconV2?url=https://jdtf.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

](https://jdtf.or.jp/news/2025/pdf/0220/1_KeyNote_NTA.pdf)[![](https://t0.gstatic.com/faviconV2?url=https://www.nta.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

](https://www.nta.go.jp/law/tsutatsu/kobetsu/kansetsu/20180606/index.htm)

![](https://www.gstatic.com/lamda/images/immersives/google_logo_icon_2380fba942c84387f09cf.svg)

[![](https://t3.gstatic.com/faviconV2?url=https://www.nichizeiren.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

](https://www.nichizeiren.or.jp/wp-content/uploads/invoice/invoice4b.pdf)[![](https://t0.gstatic.com/faviconV2?url=https://jdtf.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

](https://jdtf.or.jp/news/2025/pdf/0220/1_KeyNote_NTA.pdf)[![](https://t0.gstatic.com/faviconV2?url=https://www.canon-its.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

](https://www.canon-its.co.jp/solution/industry/cross-industry/superstream/column/article/w-peppol-m)[![](https://t0.gstatic.com/faviconV2?url=https://www.digital.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

](https://www.digital.go.jp/policies/electronic_invoice)

![](https://www.gstatic.com/lamda/images/immersives/google_logo_icon_2380fba942c84387f09cf.svg)

[![](https://t0.gstatic.com/faviconV2?url=https://www.fastaccounting.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

](https://www.fastaccounting.jp/blog/20210719/6625/)[![](https://t0.gstatic.com/faviconV2?url=https://www.digital.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

](https://www.digital.go.jp/policies/electronic_invoice)

![](https://www.gstatic.com/lamda/images/immersives/google_logo_icon_2380fba942c84387f09cf.svg)

[![](https://t0.gstatic.com/faviconV2?url=https://www.denshichoubohozon.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

](https://www.denshichoubohozon.com/special/consultant_column1_2.html#:~:text=%E5%B8%B3%E7%B0%BF%E9%96%93%E3%81%AE%E7%9B%B8%E4%BA%92%E9%96%A2%E9%80%A3%E6%80%A7%E3%81%AE%E7%A2%BA%E4%BF%9D%E8%A6%81%E4%BB%B6%E3%81%AF,%E3%81%AB%E3%82%82%E9%81%A9%E7%94%A8%E3%81%95%E3%82%8C%E3%81%BE%E3%81%99%E3%80%82)