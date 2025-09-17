# LM-02 研修・配布計画書 v1

## Audit Header
- Project: THP-Hardening-LastOneMile
- Task ID: LM-02
- Document: LM-02_Training_and_Distribution_Plan
- Version: 2025-09-18 v1.0
- Status: Draft for NEXI/JBIC Approval
- Prepared: 2025-09-18 06:16 JST
- Prepared By: NEXI/JBIC Ops Enablement
- Reference: LM-02_Workflow_User_Manual.md

## 1. 目的
DocuSign-Gov 電子署名ワークフロー（LM-02）を NEXI/JBIC 担当者へ周知し、72h Toolkit 発動時に即応できる体制を構築する。

## 2. 対象者
| 区分 | 人数 | 備考 |
| --- | --- | --- |
| NEXI 契約班 | 8 名 | 署名起票・保証枠管理担当 |
| JBIC 市場対策班 | 6 名 | 外貨保証および CCP 調整担当 |
| OpsRoom Liaison | 4 名 | Trigger 通知・Webhook 監視 |

## 3. 配布計画
1. **メール配布**（Day 0 09:00 JST）: `LM-02_Workflow_User_Manual.md` と補足資料（TriggerTable 抜粋）を SecureMail で送信。
2. **SecureLine 説明会**（Day 0 14:00 JST）: 30 分のリモートブリーフィング。
3. **ドキュメント格納**: OpsRoom Share (`/ops/contracts/manuals/`) に最新版を配置。

## 4. 研修スケジュール
| 日時 | セッション | 講師 | 内容 |
| --- | --- | --- | --- |
| Day 0 14:00 | 導入ブリーフィング | JIMS-Operations | ワークフロー概要、Trigger 連携 |
| Day 1 10:00 | DocuSign ハンズオン | DocuSign-Gov サポート | テンプレート設定と署名手順 |
| Day 1 15:00 | 監査ログ演習 | JIMS-Finance DataOps | `audit_log.jsonl` 記録、Webhook 検証 |
| Day 2 11:00 | 総合演習 | OpsRoom Liaison | TR-01 Critical シナリオ実演 |

## 5. 理解度確認
- **クイズ**: Day 1 ハンズオン終了後に 10 問オンラインテスト。
- **実技チェック**: Day 2 総合演習で各チームが DocuSign Envelope を発行し、Commander 承認 ID を入力。
- **評価基準**: 正解率 80% 以上かつ実技完遂で合格。結果を `training_progress.csv` に登録。

## 6. フォローアップ
- 72 時間後にフォローアップ Q&A セッション（SecureLine）。
- マニュアル更新時は `LM-02_Workflow_User_Manual.md` のバージョン履歴を共有し、研修記録に追記。
- OpsRoom 監査隊が月次で実務適用状況をレビュー。

## 7. 連絡先
- 研修窓口: training@thp.ops
- DocuSign 技術問い合わせ: support@docusign-gov.jp
- OpsRoom Liaison: opsroom@thp.ops

---
*Reference: LM-02_Workflow_User_Manual.md、LM-02_Workflow_Integration_Checklist.md。*
