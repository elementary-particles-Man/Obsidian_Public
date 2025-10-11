# CCP/REPO Counter-Cyclical Technical Standard 通知（最終版）

## Audit Header
- Project: THP-Hardening-LastOneMile
- Task ID: LM-06
- Document: LM-06_Final_TS_Notice
- Version: 2025-09-18 v1.0
- Status: Pending Commander Approval ID
- Prepared: 2025-09-18 06:28 JST
- Prepared By: FSA + Exchanges Joint Taskforce
- Reference: LM-06_CCPTS_Spec.md

## 1. 適用対象
- 日本証券クリアリング機構（JSCC）
- 主要レポ市場参加行（指定 12 行）
- 関係取引所（東証・大証）
- 清算機関向け監督部局（FSA、日銀モニタリング部署）

## 2. 発動条件
本 Technical Standard は、以下を満たす場合に自動的に発効する。
1. TR-02（Market Volatility）臨界判定
2. Commander 承認 ID の付与

## 3. 対応項目
| 項目 | 現行設定 | 変更後設定 | 留意点 |
| --- | --- | --- | --- |
| Initial Margin Lookback | 5 年ローリング | 2 年ローリング + Floor | 過去ストレス期の反映比率増加 |
| Antiprocyclic Buffer | 25% | 40% | VaR ショックへの即応性確保 |
| Variation Margin Call Cutoff | T+1 14:00 | T+1 18:00 | 海外タイムゾーンとの整合 |
| Repo Haircut (JGB) | 3% | 1.5% | 国債流動性維持を優先 |
| CCP Liquidity Facility | 0 | 最大 10 兆円（LM-02 連動） | 72h 以内の供給枠 |
| Reporting Frequency | 月次 | 6 時間毎 | OpsRoom API `/lm06/report` に送信 |

## 4. 実施手順
1. Commander 承認 ID を通知書のヘッダーに追記。
2. `TS_Notice_TR02_YYYYMMDD.pdf` を生成し、Audit Header を埋め込む。
3. SecureLine 経由で対象機関へ配信し、受領確認を `compliance_log.csv` に記録。
4. CCP からの実装完了報告を受領後、OpsRoom Activation Board に反映。
5. 72 時間毎に FSA モニタリング部が実装状況をレビューし、逸脱があればエスカレーション。

## 5. データ共有
- CCP は IM/VM/Default Fund データを API `/lm06/report` で 6 時間毎に送信。
- OpsRoom ETL がデータを 5 分遅延以内でダッシュボードへ反映。
- Data Sentinel アラートで異常を検知した場合は即時通知。

## 6. 監査
- Commander 承認 ID、通知配布ログ、実装確認ログを `Legal_Audit_Report` に添付。
- Drill 結果および本番適用結果は `LM06_Drill_Report_YYYYMMDD.md` に追記。

## 7. 連絡先
- FSA 市場業務監督：fsa-market@thp.ops
- JSCC Operations Center：jscc-ops@thp.ops
- OpsRoom Liaison（LM-06）：lm06-liaison@thp.ops

---
*Reference: LM-06_CCPTS_Spec.md、LM-02 連携資料。*
