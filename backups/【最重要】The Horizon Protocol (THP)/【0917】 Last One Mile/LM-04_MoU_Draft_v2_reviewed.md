# ミニラテラル暫定協定（MoU）ドラフト v2（レビュー版）

## Audit Header
- Project: THP-Hardening-LastOneMile
- Task ID: LM-04
- Document: LM-04_MoU_Draft_v2_reviewed
- Version: 2025-09-18 v2.0-review
- Status: Review Complete (Commander Approval Pending)
- Prepared: 2025-09-18 05:12 JST
- Prepared By: Codex Support (Ops Liaison)
- Reviewers: MOFA 協力外交局、JIMS-Operations 司令補佐
- Review Window: 2025-09-18〜2025-09-20

## 第Ⅰ条（目的および適用範囲）
1. 本覚書は、日本国外務省（MOFA）、日本危機管理局（JIMS）および協定参加国政府（以下「参加当局」という）が、危機時における金融・資源・安全保障バックアップ回廊（MiniLateral Backup Rails）を迅速に立ち上げるための暫定枠組みを定める。
2. 本覚書は、LM-04 MiniLateral Backup Rails MoU 仕様書（2025-09-17版）および LM-02 72h Toolkit Deploy 仕様書に準拠し、TriggerTable（TR-04／TR-06）発動時に適用する。
3. 有効期間は署名時刻から72時間とし、Commander 承認により更新または失効させる。

## 第Ⅱ条（用語の定義）
- 「バックアップ回廊」：JPY／EUR／KRW 等の非USDスワップ枠、物資輸送ルート、OpsRoom経由のデータ連携を束ねた緊急運用ラインをいう。
- 「TriggerTable」：LM-01 危機ダッシュボード起点の臨界指標一覧であり、TR-04（通貨）および TR-06（NATO 配備）を本覚書の発動条件とする。
- 「Audit Header」：`audit.project` などのキーを含む監査メタデータセットをいう。
- 「Commander 承認」：THP司令部指揮官が付与する承認 ID を指し、更新・停止・改訂の必須統制ステップとする。

## 第Ⅲ条（運用枠組み）
1. 参加当局は以下の責務を分担する。
   1. MOFA：外交ルートの確保、交換公文（Exchange of Notes）の調整、連絡窓口リストの維持。
   2. JIMS：OpsRoom 管制、危機監視データ統合、Audit Snapshot 作成および配布。
   3. 参加当局：自国の財務・通商・国境警備機関からなる危機対応セルを編成し、本覚書に基づくマニュアルを遵守する。
2. 発動条件発生時、OpsRoom センターは `MiniLateral_Activation_Log.jsonl` に Audit Header 付きで記録し、SecureLine または指定 VPN にて各当局へ通知する。
3. 通貨・物資の優先順位は別紙「MiniLateral 資源配分表」に従い、Commander 承認なしに変更してはならない。
4. スワップおよび決済メッセージングは mBridge、CIPS、SWIFT バックアップキューなど仕様書で定める冗長経路を使用する。

## 第Ⅳ条（金融・決済条件）
1. スワップウィンドウ初期キャップは各通貨 500 億相当とし、状況評価のうえ 30% 刻みで再設定できる。再設定時は Commander 承認 ID を添付する。
2. 担保適格資産は日本国債、Korea Treasury Bond、EU 加盟国 AA 格以上国債、金地金（LBMA 基準）および OpsRoom が承認した流動性資産に限定する。
3. 決済時間帯は 24 時間ローリング運用とし、OpsRoom が定める 3 時間サイクルのカットオフに従う。
4. スワップ資金のフローバック抑止のため、受入先金融機関へのモニタリングログを 72 時間毎に共有する。

## 第Ⅴ条（連絡および調整）
1. 各当局は以下のリエゾン窓口を指定し、常時連絡可能な体制を維持する。

| 区分 | 主管 | 連絡手段 | 代替手段 |
| --- | --- | --- | --- |
| 日本 | THP OpsRoom（連絡責任：JIMS-Operations） | SecureLine／専用 VPN | エアギャップ端末＋暗号化 FAX |
| 協定国A | National Crisis Management Centre | NATO VPN | セーフメールゲートウェイ |
| 協定国B | Government Centre for Security | EU-Resilience Network | 政府衛星フォン |

2. 重要な通話・文書交換は `mou_liaison_log_YYYYMMDD.jsonl` に Audit Header 付きで記録する。
3. OpsRoom Comms Officer は通信障害発生時、即時に代替チャネルへ切り替え、Commander へ報告する。

## 第Ⅵ条（情報保護と監査）
1. 本覚書に基づく全通信は「雪玉」分類以上の暗号化基準に従い、E2E 暗号化とアクセス制御を必須とする。
2. 署名後 72 時間以内に Audit Snapshot を作成し、Commander 承認 ID・適用 Trigger・調整ログを付して War-Room 監査隊へ送付する。
3. 有効期限満了 24 時間前までに再評価会合を開催し、更新可否を決定する。更新する場合は `Audit Snapshot` を再作成し、`MoU_Progress_Log.jsonl` に追記する。
4. 情報漏洩発生時は Incident ID を付した事故報告を 48 時間以内に OpsRoom へ提出し、再発防止策を共有する。

## 第Ⅶ条（署名および発効）
1. 以下の代表者による署名をもって本覚書は効力を生ずる。
   - 日本国外務省　〇〇局長
   - 日本危機管理局　局長
   - 協定国A　外務大臣（もしくは代理）
   - 協定国B　財務副大臣（もしくは代理）
2. 署名原本は各当局が 1 部ずつ保管し、デジタル写しは OpsRoom 安全ファイル領域 `/mou/signed/YYYYMMDD/` に保存する。
3. Commander 承認後、OpsRoom は Exchange of Notes を各当局へ配布し、`distribution_log.jsonl` に配布記録を残す。

## 付録A（レビュー差分サマリ）
- 第Ⅲ条・第Ⅳ条において、資源配分表の扱いとフローバック抑止手順を明文化。
- 第Ⅵ条で Incident 対応の 48 時間期限を追加。
- 署名節に「Commander 承認後の配布フロー」を明示。
- 語句を統一し、Audit Header 情報を最新化。

---
*Reference: LM-04 MiniLateral Backup Rails MoU 仕様書（2025-09-17）、LM-02 72h Toolkit Deploy 仕様書、レビューコメント（MOFA 2025-09-18 04:58 JST、JIMS 2025-09-18 05:03 JST）。*
