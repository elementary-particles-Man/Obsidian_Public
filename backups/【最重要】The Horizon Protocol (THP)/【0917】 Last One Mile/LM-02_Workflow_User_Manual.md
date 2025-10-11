# LM-02 電子署名ワークフロー運用マニュアル v1

## Audit Header
- Project: THP-Hardening-LastOneMile
- Task ID: LM-02
- Document: LM-02_Workflow_User_Manual
- Version: 2025-09-18 v1.0
- Status: Draft for NEXI/JBIC Adoption
- Prepared: 2025-09-18 05:55 JST
- Prepared By: Codex Support (Ops Liaison)
- Reviewed By: NEXI 契約班、JBIC 市場対策班

## 1. 目的
`LM-02_Emergency_Finance_Contract_Final.docx` を用いた DocuSign-Gov 電子署名ワークフローの標準運用手順を示す。TriggerTable 連携と Audit Header 要件を満たしつつ、72 時間以内の保証枠立ち上げを実現する。

## 2. 前提条件チェックリスト
- [ ] DocuSign-Gov アカウント（NEXI 契約班、JBIC 市場対策班）
- [ ] SecureLine/VPN 経由で OpsRoom Webhook (`/ops/contracts/ack`) へアクセス可能
- [ ] `Contract Registry` PostgreSQL 接続情報
- [ ] Commander 承認 ID 管理（`MoU_Progress_Log.jsonl`、`audit_log.jsonl`）

## 3. テンプレート設定手順
1. DocuSign テンプレートを作成し、`LM-02_Emergency_Finance_Contract_Final.docx` をアップロード。
2. 署名順序を `甲→乙→丙→丁` に設定。各ロールにメール通知＋SMS オプションを付与。
3. テキストフィールドへ Audit Header キーを事前入力（Project/Task/Version など）。
4. カスタムフィールド `commander_approval_id` を必須項目に設定。
5. 完了時コールバック URL に OpsRoom Webhook を指定し、署名完了後の JSON を送信させる。

## 4. 運用フロー
1. **Trigger 検知**：TR-01/02/04/06 いずれかが Critical 判定 → OpsRoom から発動通知。
2. **案件登録**：72h Toolkit Coordinator が `Contract Registry` に案件番号を生成し、DocuSign Envelope を起動。
3. **署名プロセス**：各ロールが DocuSign 通知に従って署名。署名期限はデフォルト 6 時間に設定。
4. **Audit 記録**：DocuSign 完了通知を受信後、`audit_log.jsonl` に案件番号・Trigger コード・Commander 承認 ID を追記。
5. **PDF 保管**：署名済み PDF を `/contracts/signed/YYYYMMDD/` に格納し、メタデータ JSON を併置。
6. **通知完了**：OpsRoom から Commander へ完了報告。必要に応じ LM-05 告示と連動。

## 5. TriggerTable 連携要件
| Trigger | 必須アクション | 担当 |
| --- | --- | --- |
| TR-01 Treasury | 1 時間以内に保証枠起動ログ送信、財投臨時枠反映 | NEXI 契約班 |
| TR-02 Market Vol | CCP 調整メモを DocuSign 署名完了メールに添付 | JBIC 市場対策班 |
| TR-04 FX Buffer | MiniLateral 外貨枠移管指示と同期、OpsRoom へ報告 | NEXI/JBIC 外貨チーム |
| TR-06 NATO Sentinel | 国境輸送保証設定の結果を JIMS OpsRoom に送付 | JIMS Ops Liaison |

## 6. トラブルシューティング
- **署名者遅延**：SMS リマインダを送信し、6 時間経過で Commander にエスカレーション。
- **DocuSign 障害**：紙ベース署名（`/contracts/manual/YYYYMMDD/`）へ切替え、後続で電子化。
- **Webhook エラー**：OpsRoom からリトライコマンドを発行し、成功時に `ack_tracker.csv` を更新。

## 7. 監査・報告
- 72 時間毎に合同レビューを実施し、`Legal_Audit_Report` に進捗を記載。
- Commander 承認 ID を含む監査スナップショットを OpsRoom Secure Storage へアップロード。

---
*Reference: LM-02_Workflow_Integration_Checklist.md、LM-02_Emergency_Finance_Contract_Final.docx。*
