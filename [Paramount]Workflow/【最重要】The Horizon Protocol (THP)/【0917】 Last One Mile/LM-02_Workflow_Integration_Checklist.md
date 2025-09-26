# LM-02 ワークフロー統合チェックリスト v1

## Audit Header
- Project: THP-Hardening-LastOneMile
- Task ID: LM-02
- Document: LM-02_Workflow_Integration_Checklist
- Version: 2025-09-18 v1.0
- Status: Draft (Commander Approval Pending)
- Prepared: 2025-09-18 05:28 JST
- Prepared By: Codex Support (Ops Liaison)
- Review Window: 2025-09-18〜2025-09-21

## 1. 目的
`LM-02_Emergency_Finance_Contract_Final.docx` を NEXI/JBIC の DocuSign-Gov 電子署名ワークフローへ組み込み、TriggerTable 連携および監査要件を満たすためのチェックリストを提供する。

## 2. 前提条件
- DocuSign-Gov テンプレート権限（NEXI 契約班／JBIC 市場対策班）。
- `Contract Registry` PostgreSQL 接続情報。
- SecureLine/VPN 経由での OpsRoom Webhook にアクセス可能であること。

## 3. 電子署名ワークフロー設定
1. DocuSign テンプレートを作成し、`LM-02_Emergency_Finance_Contract_Final.docx` をアップロード。
2. 署名欄（甲・乙・丙・丁）にロールを割り当て、署名順序を `甲→乙→丙→丁` と設定。
3. Audit Header を DocuSign メタデータに入力（`customField.audit_project` 等）。
4. 署名完了後のコールバック URL を OpsRoom Webhook に設定し、`POST /ops/contracts/ack` で通知させる。

## 4. TriggerTable 連携チェック
| 項目 | 内容 | 担当 |
| --- | --- | --- |
| TR-01 連携 | Commander 承認後 1h 以内に保証枠起動ログを送信 | NEXI 契約班 |
| TR-02 連携 | CCP 調整結果を DocuSign 完了通知に添付 | JBIC 市場対策班 |
| TR-04 連携 | MiniLateral 外貨枠再配分を `MiniLateral_Activation_Log.jsonl` と同期 | NEXI/JBIC 外貨チーム |
| TR-06 連携 | 国境輸送保証設定の結果を JIMS OpsRoom へ報告 | JIMS Ops Liaison |

## 5. 監査・記録
1. 署名完了 PDF を `/contracts/signed/YYYYMMDD/` に保存し、Audit Header を JSON メタファイルとして併置。
2. `audit_log.jsonl` へ案件番号、Trigger コード、Commander 承認 ID を追記。
3. 72 時間毎に合同レビューを実施し、`Legal_Audit_Report` にサマリを記載。

## 6. テストシナリオ
- **シナリオA**：TR-01 Critical → DocuSign 発動 → 1 時間以内に保証枠起動を確認。
- **シナリオB**：TR-04 Critical → MiniLateral 外貨枠の再配分通知と DocuSign 完了通知が突合できること。
- **シナリオC**：DocuSign 障害発生時、紙ベース署名へ切り替え (`/contracts/manual/YYYYMMDD/`) し、後追いで電子化する手順を確認。

---
*Reference: LM-02_Toolkit_Spec.md、LM-02_Emergency_Finance_Contract_Final.docx。*
