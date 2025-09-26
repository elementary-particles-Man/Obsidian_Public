# THP-Hardening-LastOneMile

## プロジェクト概要
- ステータス: **FREEZE中**（計画および責任体制は固定。変更時は責任者承認を得ること）
- 運用タイムゾーン: Asia/Tokyo (UTC+09:00)
- 監査要件: すべての成果物に Audit Header を付与すること

## 重要マイルストーン
| フェーズ | 日付/期間 (JST) | 補足 |
| --- | --- | --- |
| T-13 ~ T-1 | 2025-09-17 〜 2025-09-29 | 最終調整期間。全タスクの前倒し準備を完了させる。|
| T0 | 2025-09-30 | 本番切替（Last One Mile 実行日）。|
| T+30 | 2025-10-30 | 定着化レビュー＆事後監査期限。|

## ロールバック・ガバナンス
- 既定有効期限: 発令から72時間
- 更新要件: Commander Approval が必須

## タスクサマリ
| ID | タスク名 | オーナー | 締切 (JST) | 依存関係 | 期待成果 |
| --- | --- | --- | --- | --- | --- |
| LM-01 | CrisisDashboard_v1 | JIMS-Finance | 2025-09-20 18:00 | なし | KPI+Trigger live / AuditHeader enabled |
| LM-02 | 72h_Toolkit_Deploy | NEXI/JBIC | 2025-09-22 12:00 | LM-01 | Contracts+Seals ready / TriggerTable |
| LM-03 | Financial_C4ISR_Standup | JIMS-Operations | 2025-09-22 18:00 | なし | OpsRoom live / CCDCOE/FIRST liaison |
| LM-04 | MiniLateral_Backup_Rails_MoU | MOFA+JIMS | 2025-09-24 12:00 | LM-03 | ExchangeOfNotes/MoU |
| LM-05 | Legal_Triggers_Promulgation | MoJ+AllMinistries | 2025-09-24 18:00 | LM-01 | Official Gazette/Notices |
| LM-06 | CCP_REPO_CounterCyclical_TS | FSA+Exchanges | 2025-09-25 12:00 | なし | TechnicalStandard notice |
| LM-07 | Comms_Pack_Finalization | THP-Comms | 2025-09-25 18:00 | LM-01 | 3_templates_ready |

## 実行ルール
1. 期限はすべて JST で管理する。
2. 依存関係を満たしていないタスクは着手前に解除計画を提示する。
3. 成果物は Audit Header を付与し、リモート共有前に凍結状態を確認する。
4. 緊急時はロールバック・ポリシーに従い、72時間以内に判断を下す。
5. 各種メッセージは原則として日本語で応答する。
6. 本階層より上位ディレクトリのデータは読み取り専用として扱う。
