# LM-05 官報告示 配布・採番手順 v1

## Audit Header
- Project: THP-Hardening-LastOneMile
- Task ID: LM-05
- Document: LM-05_Distribution_Procedure
- Version: 2025-09-18 v1.0
- Status: Draft (Commander Approval Pending)
- Prepared: 2025-09-18 05:24 JST
- Prepared By: Codex Support (Ops Liaison)
- Review Window: 2025-09-18〜2025-09-21

## 1. 目的
MoJ および各省庁が `LM-05_Official_Gazette_Draft_v1.md` を根拠として官報告示を発行する際の配布ログ運用と告示 ID 採番フローを定義する。Audit Header を保持したまま迅速に公示可能とすることが狙い。

## 2. 告示 ID 採番フロー
1. **予約**：法務省官報担当が `distribution_id_registry.jsonl` に仮 ID（例：`20250918-LM05-001`）を追記し、Commander 承認を申請。
2. **承認**：Commander 承認 ID 取得後、同じエントリに `commander_approval_id` フィールドを追加。
3. **確定**：告示原稿（Markdown）と PDF 版双方の冒頭に告示 ID を記載し、版管理タグ（例：`Rev-A`）を追記。
4. **通知**：告示 ID 確定後 30 分以内に各省庁 Liaison へ SecureLine で共有。

### `distribution_id_registry.jsonl` エントリ例
```json
{
  "timestamp": "2025-09-18T05:20:11+09:00",
  "draft": "LM-05_Official_Gazette_Draft_v1.md",
  "notice_id": "20250918-LM05-001",
  "commander_approval_id": "PENDING"
}
```

## 3. 配布ログ運用
1. **主ログ**：`distribution_log.jsonl` に下記フィールドで追記。
   - `timestamp`, `notice_id`, `recipient`, `channel`, `ack_deadline`, `audit_header`
2. **Ack トラッキング**：GARoon もしくは専用フォームで受領確認を収集し、`ack_tracker.csv` に転記。
3. **監査連携**：日次で `promulgation_log.jsonl` と突合し、未配布／未確認項目が無いかチェック。
4. **保管**：ログファイルは `/ops/legal-public/` の `YYYYMMDD` ディレクトリにローテーションして保存。

## 4. ドキュメント整備手順
1. `LM-05_Official_Gazette_Draft_v1.md` を PDF 化し、Audit Header を PDF プロパティと扉ページに反映。
2. 官報電子版アップロード時は暗号化 ZIP（AES-256）で一時保管し、公開後速やかに削除。
3. 一般公開用要約は THP Comms テンプレート（LM-07）に準拠し、政治敏感情報をマスク。

## 5. 監査・再評価
- 72 時間毎に `Legal_Audit_Report` に配布状況サマリを追記。
- 告示失効時は `distribution_log.jsonl` の該当 ID に `status: "expired"` を追加し、再配布可否を Commander に報告。

---
*Reference: LM-05_Legal_Trigger_Spec.md、LM-05_Official_Gazette_Draft_v1.md。*
