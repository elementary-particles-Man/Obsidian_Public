REFINED_BY_CODEX: 2025-09-17T00:00:00Z
REFINED_BY_CODEX: 2025-09-17T00:00:00Z

AUDIT_TRAIL:
AUDIT_TRAIL:

- 2025-09-17T00:00:00Z 翻訳 (JP→EN) と指標用語の整合を実施。
- 2025-09-17T00:00:00Z Executed JP-to-EN translation with KPI terminology alignment.

# THP-7: Ops KPI Dashboard - 運用計測基盤
# THP-7: Ops KPI Dashboard - Operations Measurement Platform

**Version:** Ops-KPI-Dashboard rev.3.1 (Walpurgis Edition)** **最終更新：2025年9月15日 JST**
**Version:** Ops-KPI-Dashboard rev.3.1 (Walpurgis Edition)** **Last Updated: 15 September 2025 JST**

## Level 1: 司令部サマリー（作戦発動ステータス）
## Level 1: Command Summary (Operation Activation Status)

### 市場『無風』の定義値（数値閾値）
### Definition of “Calm Markets” (Numerical Thresholds)

- VIX：3営業日移動で変動幅が±5%以内 かつ 水準 < 20。
- VIX: 3-trading-day moving change within ±5% and level < 20.
- MOVE：100 以下継続（3営業日）。
- MOVE: Sustained ≤ 100 for three trading days.
- 米10年金利・実効ボラ（20日年率化）：≤ 75bp。
- U.S. 10-year yield realized volatility (annualized over 20 days): ≤ 75 bp.
- 上記が同時充足：無風=GREEN。2/3充足：注意=YELLOW。未充足：平常=WHITE。
- All thresholds met: Calm = GREEN. Two of three met: Watch = YELLOW. Unmet: Normal = WHITE.

**目的：1分で世界の状況を把握し、THPの自動執行状況を確認する。**
**Purpose: Grasp global conditions in one minute and confirm THP’s automated execution status.**

|ドメイン|現在のステータス|トリガー要因|備考|
|Domain|Current Status|Trigger Factor|Notes|
|---|---|---|---|
|**グローバル金融**|🟡 **発動準備 (Armed)**|ドル信認の構造的低下（※Composite依存）|臨界トリガー監視中|
|**Global Finance**|🟡 **Armed**|Structural decline in dollar credibility (Composite-dependent)|Monitoring critical triggers|
|**地政学リスク**|🟡 **発動準備 (Armed)**|NATO第4条協議要請（※外部報道の確定事象に依存）|エスカレーション監視中|
|**Geopolitical Risk**|🟡 **Armed**|Request for NATO Article 4 consultations (depends on confirmed external reporting)|Watching for escalation|
|**社会・格差**|🟡 **発動準備 (Armed)**|格差拡大による孤立主義的ポピュリズムの強化|負の循環を監視|
|**Society & Inequality**|🟡 **Armed**|Rise of isolationist populism driven by widening inequality|Monitoring negative cycle|
|**資源・物流**|🟢 **正常 (Green)**|WTI価格は安定レンジ内¹|監視継続|
|**Resources & Logistics**|🟢 **Green**|WTI prices within stable range¹|Continue monitoring|
|**THP内部**|🟢 **正常 (Green)**|全システム正常|待機状態|
|**Internal THP**|🟢 **Green**|All systems nominal|Standing by|

¹ _原油価格は$60-80/bblの安定レンジ内。穀物指数(YoY -5%)は季節要因を含む。_
¹ _Crude oil prices remain in the $60–80/bbl range. Grain index (YoY -5%) includes seasonal factors._

## Level 2: 自動執行トリガーパネル
## Level 2: Automated Execution Trigger Panel

**目的：各領域のトリガー条件と現在のステータスを精密に監視する。トリガー超過は、THP-lifeline計画に定義されたアクションを自動的に実行する。**
**Purpose: Monitor trigger conditions and current status across each domain in detail. Exceeding a trigger automatically executes actions defined in the THP-lifeline plan.**

### 1. グローバル金融市場
### 1. Global Financial Markets

**サマリー：ドルからの信認逃避は継続。Tricolor社の破綻はサブプライム市場への前震であり、監視を強化する。**
**Summary: Flight from the dollar continues. The failure of Tricolor is a foreshock for the subprime market; tighten monitoring.**

|KPI|単位|現在値|**執行トリガー (Execution Trigger)**|ステータス|
|KPI|Unit|Current Value|**Execution Trigger**|Status|
|---|---|---|---|---|
|**UST入札：テール (10Y/30Y)²**|bp|+1.5|≥ +5|🟢 GREEN|
|**UST Auction Tail (10Y/30Y)²**|bp|+1.5|≥ +5|🟢 GREEN|
|**UST入札：応札倍率²**|x|2.45|< 2.10|🟢 GREEN|
|**UST Auction Bid-to-Cover²**|x|2.45|< 2.10|🟢 GREEN|
|**UST入札：間接比率²**|%|62|< 50|🟢 GREEN|
|**UST Auction Indirect Share²**|%|62|< 50|🟢 GREEN|
|**FRA–OIS 3M**|bp|25|> 70|🟢 GREEN|
|**FRA–OIS 3M**|bp|25|> 70|🟢 GREEN|
|**MOVE (金利ボラ)**|index|110|≥ 170|🟢 GREEN|
|**MOVE (Rate Volatility)**|index|110|≥ 170|🟢 GREEN|
|**X-Currency Basis: USD/JPY**|bp|-40|≤ −80|🟢 GREEN|
|**X-Currency Basis: USD/JPY**|bp|-40|≤ −80|🟢 GREEN|
|**HY OAS**|bp|350|≥500(🟡) / ≥600(🔴)|🟡 **WATCH**|
|**HY OAS**|bp|350|≥500 (🟡) / ≥600 (🔴)|🟡 **WATCH**|
|**サブプライム自動車ローンABS (BBB) スプレッド**|bp|大幅拡大|> 450|🟡 **WATCH**|
|**Subprime Auto Loan ABS (BBB) Spread**|bp|Surging|> 450|🟡 **WATCH**|
|**DXY（ドル指数）³**|index|97.5|※Composite依存|🟢 GREEN|
|**DXY (Dollar Index)³**|index|97.5|Composite-dependent|🟢 GREEN|
|**金価格³**|USD/oz|3,679|※Composite依存|🟢 GREEN|
|**Gold Price³**|USD/oz|3,679|Composite-dependent|🟢 GREEN|

² _上記3項目は「3点同時到達」によりAMBER/REDへ格上げ。_ ³ _DXY×Gold×WTIが同時上昇した場合に限りAMBER/REDへ格上げ。単独では判定しない。_
² _Elevate to AMBER/RED only when the three marked items hit thresholds simultaneously._ ³ _Upgrade to AMBER/RED only when DXY, gold, and WTI rise together; no single indicator triggers escalation._

### 2. 地政学リスク
### 2. Geopolitical Risk

**サマリー：軍事行動の予測は行わない。検証・確定された政治・法的事象のみをトリガーとして扱う。**
**Summary: Do not forecast military action; only verified and confirmed political or legal events act as triggers.**

|KPI|単位|現在値/状況|**執行トリガー (Execution Trigger)**|ステータス|
|KPI|Unit|Current Value / Status|**Execution Trigger**|Status|
|---|---|---|---|---|
|**NATO第4条**|N/A|協議要請（Formal未了）|**正式発動**|🟡 ARMED|
|**NATO Article 4**|N/A|Consultation request (formalization pending)|**Formal invocation**|🟡 ARMED|
|**BTP-Bund 10Y スプレッド**|bp|95|> 100|🟢 GREEN|
|**BTP-Bund 10Y Spread**|bp|95|> 100|🟢 GREEN|
|**CNH/CNY スプレッド**|pips|15|≥100(🟡) / ≥200(🔴)|🟢 GREEN|
|**CNH/CNY Spread**|pips|15|≥100 (🟡) / ≥200 (🔴)|🟢 GREEN|
|**香港CRE空室率**|%|19|> 20% & NPL急増|🟡 ARMED|
|**Hong Kong CRE Vacancy Rate**|%|19|> 20% plus surge in NPLs|🟡 ARMED|

### 3. 社会・格差
### 3. Society and Inequality

**サマリー：富の偏在はワルプルギス直撃層（下位50％）を生み、抗議すらできない“悪性の安定”を形成。その結果、孤立主義的ポピュリズムが強化され、さらに格差が拡大する負の循環を監視対象とする。**
**Summary: Wealth concentration creates a Walpurgis-struck cohort (bottom 50%) and a malignant stability that suppresses protest. The resulting isolationist populism amplifies inequality; monitor this negative loop.**

|KPI|単位|現在値/状況|**執行トリガー (Execution Trigger)**|ステータス|
|KPI|Unit|Current Value / Status|**Execution Trigger**|Status|
|---|---|---|---|---|
|**下位50％の資産シェア**|%|2.5|≤2.0 に低下|🟡 WATCH|
|**Asset Share of Bottom 50%**|%|2.5|Drops to ≤ 2.0|🟡 WATCH|
|**格差ナラティブ発話（トランプ節等）**|件/月|増加中|同一週に「海外支援批判＋家計簿財政言説」が重なる|🟡 WATCH|
|**Inequality Narrative Incidents (e.g., Trumpist rhetoric)**|cases/month|Rising|Same week combines “anti-foreign-aid” and “household-budget fiscal” rhetoric|🟡 WATCH|
|**暴動・抗議件数**|件/月|極小（沈静化）|「抗議行動ゼロ」＋インフレ率上昇が同時観測|🔴 ALERT|
|**Riots / Protests**|cases/month|Minimal (subdued)|“Zero protests” observed alongside rising inflation|🔴 ALERT|

### 4. 資源・物流・その他
### 4. Resources, Logistics, and Other Items

**サマリー：エネルギー・食料市場は安定。ミクロな信用リスクは監視を継続。**
**Summary: Energy and food markets remain stable; continue monitoring micro-level credit risk.**

|KPI|単位|現在値|**執行トリガー (Execution Trigger)**|ステータス|
|KPI|Unit|Current Value|**Execution Trigger**|Status|
|---|---|---|---|---|
|**原油 WTI**|USD/bbl|72|≥ 80 or ≤ 60|🟢 GREEN|
|**Crude Oil WTI**|USD/bbl|72|≥ 80 or ≤ 60|🟢 GREEN|
|**穀物指数 (YoY)**|%|-5|≥ +30|🟢 GREEN|
|**Grain Index (YoY)**|%|-5|≥ +30|🟢 GREEN|
|**Chapter11件数 (週)**|件|4|> 10 (特定セクター)|🟢 GREEN|
|**Chapter 11 Filings (weekly)**|cases|4|> 10 (specific sector)|🟢 GREEN|

### 民族・文化紛争KPI（People-Charter接続）
### Ethno-Cultural Conflict KPIs (Linked to People Charter)

- 強制移住（7日累計）：>10,000＝🔶警報、>30,000＝🔴制裁起動提案。
- Forced displacement (7-day total): >10,000 = 🔶 Alert, >30,000 = 🔴 Sanction activation proposal.
- 民間人殺傷（週／10万人）：>5＝🔶、>20＝🔴（UN-PDF審査）。
- Civilian casualties (weekly per 100,000): >5 = 🔶, >20 = 🔴 (UN-PDF review).
- 宗教施設攻撃：1件🔶／3件連続🔴。
- Attacks on religious facilities: 1 incident = 🔶 / 3 consecutive incidents = 🔴.
- 合意不履行（監督評価×）：連続2期で金融制裁段階1を自動提案。
- Agreement breaches (oversight rating ×): Two consecutive periods automatically propose Financial Sanction Stage 1.

### 版管理（命名統一）
### Version Control (Naming Standardization)

- 本ドキュメントの表題は**THP-7_Ops_KPI_Dashboard-運用計測基盤**で統一する（別名の重複版は廃止）。
- Standardize the title of this document as **THP-7_Ops_KPI_Dashboard-運用計測基盤** (retire duplicate versions under other names).
