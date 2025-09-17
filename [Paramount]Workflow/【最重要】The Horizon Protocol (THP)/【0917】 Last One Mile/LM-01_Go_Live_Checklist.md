# LM-01 危機ダッシュボード Go-Live チェックリスト v1

## Audit Header
- Project: THP-Hardening-LastOneMile
- Task ID: LM-01
- Document: LM-01_Go_Live_Checklist
- Version: 2025-09-18 v1.0
- Status: Pending Commander Approval
- Prepared: 2025-09-18 06:09 JST
- Prepared By: JIMS-Finance DataOps
- Reference: LM-01_Integration_Validation_Report.md

## 1. 承認前チェック
- [ ] Commander 承認 ID を `audit.commander_approval_id` に反映。
- [ ] KPI/Trigger JSON の署名検証（HMAC）設定完了。
- [ ] War-Room 通知テンプレートに Go-Live 宣言文を挿入。

## 2. インフラ & データ
- [ ] `../ops/dashboard-public/kpi_map.public.json` から最新 `generated_at` 値を取得。
- [ ] `../ops/dashboard-public/triggers.public.json` の alerts 配列にブリーフィングメッセージを格納。
- [ ] 5 分インターバル再取得 `setInterval` の監視を OpsRoom Cron に登録。
- [ ] KPI/Trigger JSON バージョン番号を `version_log.jsonl` へ追記。

## 3. 監査・ログ
- [ ] `window.generateAuditSnapshot()` で初回スナップショットを生成し、`/ops/dashboard-public/audit_snapshots/` に保存。
- [ ] `audit_log.jsonl` に Go-Live イベントを以下フィールドで登録：`timestamp, operator, commander_approval_id, notes`。
- [ ] 72 時間後リビュー用リマインダを Commander ハブに設定。

## 4. 運用体制
- [ ] 值班メンバー（JIMS-Finance、OpsRoom）にアラート当番表を共有。
- [ ] TR-01/02/04/06 Critical 時の連絡先リストを更新。
- [ ] 5 分ごとの自動更新失敗時の手動リロード手順書を配布。

## 5. コミュニケーション
- [ ] Go-Live アナウンス（SecureLine ＋ メール）を下書きし、Commander 承認取得。
- [ ] LM-07 Comms と連携して一般向け要約を準備。
- [ ] KPI/Trigger 更新履歴を日次で SITREP に掲載。

## 6. 完了報告
- [ ] Commander へ Go-Live 完了報告書を送付。
- [ ] OpsRoom Situation Board にステータスを「LIVE」へ更新。
- [ ] `Legal_Audit_Report` へ Go-Live エビデンスを添付。

---
*Reference: LM-01_Integration_Validation_Report.md、KPI/Trigger public JSON logs。*
