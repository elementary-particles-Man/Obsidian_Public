# LM-01 CrisisDashboard_v1 仕様書

## Audit Header
- Project: THP-Hardening-LastOneMile
- Task ID: LM-01
- Version: 2025-09-17 v0.1
- Status: Draft (FREEZE遵守)
- Prepared: 2025-09-17 05:55 JST
- Prepared By: Codex Support (Ops Liaison)
- Review Window: 2025-09-17〜2025-09-18 (Commander Approval required for改訂)

## 1. ダッシュボード目的
米国債入札不成立を震源とするワルプルギス複合危機のリアルタイム監視と、発火閾値突破時の即応判断を支援する。金融・資源・地政学・食糧/移民のクロスドメイン指標を統合し、72時間以内の行動トリガーを明確化する。

## 2. KPI & Trigger マトリクス
| カテゴリ | KPI/Trigger | データソース (一次/代替) | 更新頻度 | 閾値 (Alert) | 備考 |
| --- | --- | --- | --- | --- | --- |
| 米国債入札 | 10Y/30Y Auction Tail Spread (WI vs High Yield) | TreasuryDirect WI feed / Bloomberg TAIL | 入札当日リアルタイム | ≥ 8bp (Watch), ≥ 12bp (Critical) | 入札開催中のみ表示、Criticalで自動赤点滅 |
| 米国債入札 | Bid-to-Cover Ratio | TreasuryDirect / Refinitiv | 入札結果確定毎 | ≤ 2.2 (Watch), ≤ 2.0 (Critical) | Historical帯で比較表示 |
| 米国債入札 | Primary Dealer Allocation % | Treasury press release / ZeroHedge集計 | 入札結果毎 | ≥ 30% (Watch), ≥ 40% (Critical) | Critical時にLM-02/05へ自動通知 |
| 金融ストレス | MOVE Index (1m) | ICE Data Indices / FRED | 15分 | ≥ 150 (Watch), ≥ 180 (Critical) | 過去30日平均比+3σも併記 |
| 金融ストレス | Subprime Auto ABS BBB OAS | JPMorgan tracker / FINRA TRACE | 30分 | ≥ +250bps (Watch), ≥ +300bps (Critical) | ρ>0.6継続時に警告バナー |
| 金融ストレス | CMBS Delinquency Rate (Office) | Trepp | 日次 | ≥ 11% (Watch), ≥ 12% (Critical) | 月次報告反映時はラベル付与 |
| 資源 | Brent Crude Price | ICE Brent Front Month | 5分 | ≥ $120 (Watch), ≥ $150 (Critical) | 45$→150$ボラを履歴チャートで表示 |
| 資源 | Global Wheat Index | FAO / CME | 1時間 | ≥ +80% YoY (Watch), ≥ +120% (Critical) | 食糧補助金連携シグナル |
| サプライ網 | TSMC Fab Utilization Proxy | 台湾当局発表 / Nikkei Asia | 日次 | 稼働率 ≤ 70% (Watch), ≤ 50% (Critical) | 公開遅延時は代替ニューステキスト |
| 中国資本 | CNH-CNY Spread (Spot) | Bloomberg CNHCNY / Wind | 5分 | ≥ 0.020 (Watch), ≥ 0.040 (Critical) | Spread拡大時にPBOC流動性指標を併記 |
| 中国資本 | PBOC FX Reserves (7DMA) | SAFE | 日次 | ≤ $3.0T (Watch), ≤ $2.8T (Critical) | 発表遅延対応でNowcast推計 |
| 食糧/移民 | Parallel FX Premium (Egypt, Nigeria) | IMF IFS / Local FX tracker | 30分 | ≥ 25% (Watch), ≥ 40% (Critical) | 報道遅延時はSNS監視補足 |
| 食糧/移民 | Fertilizer Import Price (Urea) | World Bank / Argus | 日次 | ≥ +40% QoQ (Watch), ≥ +60% (Critical) | L1/L2/L3シグナル連動 |
| 地政学 | NATO Eastern Sentinel Force Level | NATO press / Polish MOD | 1時間 | 米軍即応部隊不在=Watch、NATO内離脱表明=Critical | シナリオベース評価 |
| 地政学 | Poland-Belarus Border Throughput | Polish Customs | 日次 | 輸送量 ≤ 30%対前年比 (Watch), ≤ 10% (Critical) | 中間回廊転移率と合わせ表示 |

## 3. アラートロジック
1. **Watch**: 閾値初回突破→黄色点灯、関連タスク（LM-02/03/05等）へ通知キュー。
2. **Critical**: 上位閾値突破または複数カテゴリ同時Watch→赤点滅、OpsRoomに自動ページ。
3. **Compound**: 米国債入札Critical + 金融ストレスCriticalを同時検出→"Walpurgis Activation"バナーを発火、72h Toolkit自動起動確認フローを促す。

## 4. レイアウト設計
- **ヘッダー**: Audit Header + 現在時刻 (JST) + FREEZEロック表示。
- **グリッド**: 4列×3段のカード表示。
  - 列1: 米国債入札系 (入札日以外はヒートマップ埋め込み)
  - 列2: 金融ストレス・資源価格
  - 列3: 中国資本・サプライ網
  - 列4: 食糧/移民・地政学
- **下段**: Alert Log (過去72h) + Commander承認履歴。

## 5. データ統合要件
- 主要ソースはAPIアクセス可否を評価し、不可の場合はSFTP経由のCSV投入。
- 5分単位のETLジョブ（Airflow想定）で集計。入札日には特別ジョブを起動。
- すべてのETLは`/etl/logs`にAudit Header付ログを出力し、変更時はFREEZE解除手続き必須。

## 6. 監査ヘッダー運用
- ダッシュボードHTML/APIレスポンスに以下メタを埋め込み:
  - `audit.project`, `audit.task_id`, `audit.version`, `audit.data_timestamp`, `audit.operator`, `audit.commander_approval_id`
- データソース変更時は`change_request.md`を発行し、Commander Approvalを添付。
- 72時間毎にAudit SnapshotをPDF化し、`/audit/YYYYMMDD/LM-01`に保存。

## 7. 依存関係・連携
- LM-02: TriggerTableに閾値とアラートコードを同期。
- LM-03: OpsRoomのウォールディスプレイに自動ミラーリング。
- LM-05: 官報通知ドラフトで閾値文言を引用。
- LM-07: Commsテンプレートで用語・指標説明を統一。

---
*Source Reference: Walpurgis関連Reports (2025-09-08〜17)。*
