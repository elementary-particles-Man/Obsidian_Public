# ミニラテラル暫定協定（MoU）初稿 v1

## Audit Header
- Project: THP-Hardening-LastOneMile
- Task ID: LM-04
- Document: LM-04_MoU_Draft_v1_jp
- Version: 2025-09-18 v1.0-draft
- Status: Draft (Commander Approval Pending)
- Prepared: 2025-09-18 04:48 JST
- Prepared By: Codex Support (Ops Liaison)
- Review Window: 2025-09-18〜2025-09-20

## 第I条（目的および適用範囲）
1. 本覚書は、日本国外務省（MOFA）、日本危機管理局（JIMS）、並びに協定相手国政府機関（以下「参加当局」という）が、危機時の金融・資源・安全保障バックアップ回廊（MiniLateral Backup Rails）を即時に立ち上げるための暫定的枠組みを定める。
2. 本覚書は、LM-04 MiniLateral Backup Rails MoU 仕様書（2025-09-17版）および LM-02 72h Toolkit Deploy の関連トリガー定義を基礎とし、TriggerTable（TR-04／TR-06）発動時に適用する。
3. 本覚書は、署名日から72時間を初期有効期間とし、Commander 承認により更新される。

## 第II条（用語の定義）
本覚書において使用する主な用語の定義は以下のとおりとする。
- 「バックアップ回廊」：JPY／EUR／KRW 等の非USDスワップ枠、物資輸送ルート、OpsRoom経由のデータ連携を束ねた緊急運用ライン。
- 「TriggerTable」：LM-01危機ダッシュボード由来の警戒閾値一覧であり、TR-04（通貨）およびTR-06（NATO配備）を本覚書の発動条件とする。
- 「Audit Header」：本覚書および付随文書に付与する監査メタデータセットであり、`audit.project` 等のキーを含むものを指す。
- 「Commander 承認」：THP司令部指揮官が付与する承認IDであり、更新・停止・改訂に必須の統制ステップを表す。

## 第III条（運用枠組み）
1. 参加当局は、以下の責務を分担する。
   1.1. MOFA：外交ルート確保、交換公文（Exchange of Notes）の締結、連絡窓口リストの維持。
   1.2. JIMS：OpsRoomの統括、危機監視データの統合、Audit Snapshot 作成。
   1.3. 参加当局：自国の財務・通商・国境警備機関を束ねた危機対応セルを編成し、本覚書に従ったマニュアル運用を保証する。
2. 発動条件が満たされた場合、OpsRoom センターは `MiniLateral_Activation_Log.jsonl` にAudit Header付きで記録し、各当局へSecureLineまたは指定VPNで通知する。
3. 通貨および物資の優先順位は、別紙「MiniLateral資源配分表」に従う。配分表は Commander 承認のない限り変更できない。
4. 本覚書に基づくスワップおよび決済メッセージングは、mBridge、CIPS、SWIFTバックアップキュー等、仕様書で指定された冗長経路を使用する。

## 第IV条（金融・決済条件）
1. スワップウィンドウ：初期キャップは各通貨500億相当とし、状況評価のうえ30%刻みで再設定できる。再設定には Commander 承認IDを添付する。
2. 担保適格資産：日本国債、Korea Treasury Bond、EU加盟国AA格以上国債、金地金（LBMA基準）、およびOpsRoomが許可した流動性リストに限る。
3. 決済時間帯：24時間ローリング運用とし、OpsRoomが定める3時間サイクルのカットオフに従う。
4. フローバック抑制：スワップ資金の国内逆流を防ぐため、各参加当局は受入先金融機関へのモニタリングログを72時間ごとに共有する。

## 第V条（連絡および調整）
1. 参加当局は、下表のとおりリエゾン窓口を指定し、常時連絡可能な体制を維持する。
   | 区分 | 主管 | 連絡手段 | 代替手段 |
   | --- | --- | --- | --- |
   | 日本 | THP OpsRoom（連絡責任：JIMS-Operations） | SecureLine／専用VPN | エアギャップ端末＋暗号化FAX |
   | 協定国A | National Crisis Management Centre | NATO VPN | セーフメールゲートウェイ |
   | 協定国B | Government Centre for Security | EU-Resilience Network | 政府衛星フォン |
2. 重要通話・文書交換は、`mou_liaison_log_YYYYMMDD.jsonl` に逐次記録し、Audit Header を必ず付与する。
3. OpsRoom Comms Officer は、連絡手段に障害が生じた場合、即時に代替チャネルへ切替え、その旨を Commander へ報告する。

## 第VI条（情報保護と監査）
1. 本覚書に基づく全通信は、「雪玉」分類以上の暗号化基準に従い、E2E暗号化およびアクセス制御を必須とする。
2. Audit Snapshot：署名後72時間以内に作成し、War-Room監査隊へ送付する。Snapshot には Commander 承認ID、適用Trigger、調整ログを含める。
3. 更新・失効：初期有効期限満了の24時間前までに再評価会合を開催し、更新可否を決定する。更新する場合は、`Audit Snapshot` を再作成し、`MoU_Progress_Log.jsonl` に追記する。
4. 情報漏洩が発生した場合、参加当局は直ちにOpsRoomへ事故報告（Incident ID付き）を提出し、再発防止策を48時間以内に共有する。

## 第VII条（署名および発効）
1. 本覚書は、以下の代表者による署名をもって効力を生ずる。
   - 日本国外務省 〇〇局長
   - 日本危機管理局 局長
   - 協定国A 外務大臣（もしくは代理）
   - 協定国B 財務副大臣（もしくは代理）
2. 署名原本は各当局で1部ずつ保管し、デジタル写しはOpsRoom安全ファイル領域`/mou/signed/YYYYMMDD/`に保存する。
3. 署名後、OpsRoomは Commander 承認を経て Exchange of Notes を各当局へ配布し、配布ログを `distribution_log.jsonl` に記録する。

## 付録A（初期実行タイムライン）
| Step | 内容 | 担当 | 期限 |
| --- | --- | --- | --- |
| Step1 | MoUドラフトレビュー | MOFA 対外調整室 | T-11（2025-09-19） |
| Step2 | 対象国との事前協議・交換公文案整備 | 外務省欧米局＋参加当局 | T-10 |
| Step3 | OpsRoomにおける連絡テーブル確定・配布 | OpsRoom Comms Officer | T-9 |
| Step4 | Exchange of Notes 調印手続 | MOFA＋参加当局 | T-8 |
| Step5 | Commander 承認・施行ブリーフィング設定 | MOFA＋JIMS | T-6 |

---
*Reference: LM-04 MiniLateral Backup Rails MoU 仕様書（2025-09-17版）、LM-02 72h Toolkit Deploy 仕様書。*
