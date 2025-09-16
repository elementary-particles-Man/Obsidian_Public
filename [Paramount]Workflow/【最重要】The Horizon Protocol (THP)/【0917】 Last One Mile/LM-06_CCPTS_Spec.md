# LM-06 CCP REPO CounterCyclical TS 仕様書

## Audit Header
- Project: THP-Hardening-LastOneMile
- Task ID: LM-06
- Version: 2025-09-17 v0.1
- Status: Draft (FREEZE遵守)
- Prepared: 2025-09-17 06:02 JST
- Prepared By: Codex Support (Ops Liaison)
- Review Window: 2025-09-17〜2025-09-20 (Commander Approval required for改訂)

## 1. 目的
中央清算機関(CCP)・レポ市場向けのカウンターサイクリック技術基準を策定し、危機時に証拠金急増を抑制する通知（Technical Standard notice）を発出する。LM-01/02/05のTriggerに連動し、FSAと取引所が協調して市場安定化措置を即時実装できる状態を確保する。

## 2. 技術基準ドラフト構成
1. **適用範囲**: 国内CCP（JSCC等）および主要取引所レポ市場。
2. **発動条件**: TR-02（金融ストレス）Critical + Commander承認。
3. **証拠金調整**: Value-at-Risk期間短縮、反証拠金上限、トリガーネット比率設定。
4. **レポ市場措置**: 国債レポ取引のヘアカット上限、流動性供給枠。
5. **データ報告**: CCP日次報告要件（IM, VM, default fund）を強化。
6. **遵守監督**: FSAと取引所の共同モニタリング、OpsRoom報告義務。
7. **再評価**: 72時間毎の継続判断、ロールバック手順。
8. **附則**: Commander Approval ID、Audit Header、効力期間。

## 3. カウンターサイクリックパラメータ
| 項目 | 平常時 | 緊急措置 (TR-02) | 備考 |
| --- | --- | --- | --- |
| Initial Margin Lookback | 5年ローリング | 2年ローリング + Floor | SLR緩和と同期 |
| Antiprocyclic Buffer | 25% | 40% | VaR算出時の緩和係数 |
| Variation Margin Call Cutoff | T+1 14:00 | T+1 18:00 | 流動性負担軽減 |
| Repo Haircut (JGB) | 3% | 1.5% | 国債担保確保目的 |
| CCP Liquidity Facility | 0 | 日銀/大手行ライン 10兆円 | LM-02契約と連動 |
| Reporting Frequency | 日次 | 6時間毎 | OpsRoomへAPI連携 |

## 4. 通知フロー
1. FSA市場課がTrigger受領→技術基準発動の内諾取得。
2. 取引所・CCPと合同で`TS_Draft_vX`を確認、Commander Approvalを取得。
3. `TS_Notice_TR02_YYYYMMDD.pdf`として発出。電子署名＋Audit Header。
4. 取引所は会員へ即日配信、遵守確認を`Compliance Tracker`に記録。
5. OpsRoomが実装状況をウォールに表示、未対応アラートを発報。

## 5. データ統合
- CCPはAPIで`/lm06/report`へIM/VM/Default Fundデータ送信。
- ETLは5分ごとに更新、LM-01 Dash で金融ストレス指標と並列表示。
- 異常値検出時はData Sentinelがアラートレビュー。

## 6. 試験・演習
- **T-11 (2025-09-19)**: JSCC + 東証とのテーブルトップ。緊急TS通知→実装確認.
- **T-9 (2025-09-21)**: レポ市場ヘアカット調整演習、金融庁立会い。
- 結果は`LM06_Drill_Report_YYYYMMDD.md`に記録。

## 7. 監査要件
- TS通知および実装ログにAudit Header。
- CCP/取引所は実装証跡を`compliance_log.csv`に保存し、週次報告。
- Commander Approval IDを全通知に記録。

## 8. リスク / 緩和
| リスク | 緩和策 |
| --- | --- |
| 参加者抵抗 | War-Room経由で業界説明、LM-07テンプレで説明文書配布 |
| 機能不全 | デフォルトファンド充足状況をモニタ、必要なら予備措置発動 |
| 時間差実装 | OpsRoomでタイムライン可視化、未実装先へエスカレーション |

## 9. 連携
- LM-01: MOVE/OAS閾値連携。
- LM-02: CCP Liquidity Facility契約と同期。
- LM-03: OpsRoomで実装進捗監視。
- LM-05: 法的特例告示と整合。
- LM-07: 対外メッセージング調整。

---
*Source Reference: ワルプルギス関連Reports（金融ストレス、サブプライムABS、CCPリスク）、War-Roomプロトコル。
