# LM-02 72h Toolkit Deploy 仕様書

## Audit Header
- Project: THP-Hardening-LastOneMile
- Task ID: LM-02
- Version: 2025-09-17 v0.1
- Status: Draft (FREEZE遵守)
- Prepared: 2025-09-17 05:56 JST
- Prepared By: Codex Support (Ops Liaison)
- Review Window: 2025-09-17〜2025-09-18 (Commander Approval required for改訂)

## 1. 目的と成果物
72時間以内に発動可能な金融支援ツールキットを稼働状態にし、危機トリガーとの整合を確保する。成果物は以下の二点。
1. **Contracts + Seals ready**: 全関係機関の契約書・覚書・承認状と押印体制を凍結。
2. **TriggerTable**: LM-01のアラートコードに連動した発動テーブルを配備し、72h統制手順を紐付け。

## 2. 契約・押印マトリクス
| 区分 | 文書名 | 主体 | 押印方法 | バックアップ | 改訂責任者 |
| --- | --- | --- | --- | --- | --- |
| 緊急流動性供給 | 「為替ヘッジ支援枠協定書」 | 財務省 / 日銀 / 4メガバンク | 電子署名 (GPKI) | 紙押印キット (蓄圧シール保管庫) | 財務省 国際局 |
| 投資保険 | 「NEXI非常保証引受承諾書」 | NEXI / JBIC / 指定商社 | 電子押印 (DocuSign-Gov) | ハイブリッド（署名済PDF + 署名カード常駐） | NEXI リスク統括部 |
| 資源緊急輸入 | 「資源確保臨時輸入契約」 | 経産省 / ENEOS / JOGMEC | 実印＋局留め郵送 | スタンプレス認証（ブロックチェーン） | 経産省 資源エネ庁 |
| 食糧援助 | 「戦略備蓄開放覚書」 | 農水省 / JA全農 | 電子署名＋来署 | 紙押印（即日宅配） | 農水省 食料安全保障課 |
| 法制緊急通知 | 「特例告示文案」 | 法務省 / 全省庁 | 電子決裁 (GARoon) | ハードコピー（防火庫） | 法務省 総務課 |

### 押印体制の基本原則
- 電子押印が第一、停電/通信遮断時はバックアッププロトコルを3時間以内に移行。
- 守秘ランク"雪玉"書庫に最新署名鍵を保管。持出時はOpsRoomログへ自動記帳。
- 押印依頼は`contracts@thp.ops`キュー経由で送信し、SLA 30分以内。

## 3. 押印ワークフロー
1. **Trigger受領**（LM-01からのアラートコード）→ 72h Toolkit Coordinatorへ自動通知。
2. **ドラフト凍結確認**：最新版ドキュメントIDを`Contract Registry`から取得。
3. **押印手配**：電子押印→完了後PDFを`/contracts/signed/YYYYMMDD`へ保存。
4. **監査記録**：Audit Headerをメタデータ化し、`audit_log.jsonl`へ追記。
5. **通知**：関係機関へ送信し、受領確認を`Ack Tracker`に記録。

## 4. TriggerTable 定義
| Code | 発火条件 (LM-01参照) | 対応窓口 | 行動指針 (T+0〜T+72h) | 契約/文書 |
| --- | --- | --- | --- | --- |
| TR-01 | 米国債入札 Critical (Tail≥12bp or Bid-to-Cover≤2.0) | 財務省 国際局 | T+1h: 為替ヘッジ枠拡張通達 / T+12h: ドル流動性供給発動 | 為替ヘッジ支援枠協定書 |
| TR-02 | MOVE≥180 & Subprime OAS≥300bps | 金融庁・日銀 | T+2h: CCP証拠金緩和案レビュー / T+24h: 共同行動宣言 | CCP証拠金暫定特例通知 |
| TR-03 | 原油≥150$ or 小麦YoY≥120% | 経産省 / 農水省 | T+1h: 資源備蓄放出シナリオ承認 / T+24h: 代替調達契約発動 | 資源確保臨時輸入契約 / 戦略備蓄開放覚書 |
| TR-04 | CNH-CNY Spread≥0.04 & PBOC FX Reserve≤$2.8T | 内閣官房 経済安保室 | T+3h: 中国カントリーリスク評価更新 / T+36h: サプライ再配置通達 | ミニラテラルMoU草案 (LM-04連携) |
| TR-05 | Parallel FX Premium≥40% (Egypt/Nigeria) | 外務省 / 農水省 | T+4h: 人道支援枠調整 / T+48h: 食糧支援輸送決定 | 食糧援助覚書 |
| TR-06 | NATO Eastern Sentinel 米軍不在 | 防衛省 / MOFA | T+2h: 東方センチネル代替戦力調整 / T+24h: MiniLateral通信発動 | 防衛協力緊急合意書 |

### テーブル運用
- TriggerTableは`TriggerTable_v1.xlsx`として格納。変更時はCommander Approval。
- 各コードに`Action Checklist`を紐付け、完了時刻と担当者を記録。

## 5. データ連携
- LM-01ダッシュボードからWebhooks経由でTriggerTable APIへ通知。Webhook署名鍵はWar-Roomプロトコルに従い24h毎にローテーション。
- `Contract Registry`はPostgreSQL (HA構成) を使用。テーブル`contracts`に`audit_header`列をJSONBで保持。
- 72h Toolkitポータルはアクセス制御をWar-Roomアカウントで統一。

## 6. ドライラン計画
- **T-12 (2025-09-18) 10:00 JST**: TR-01/02模擬演習。電子押印〜通知まで60分以内達成を目標。
- **T-11 (2025-09-19) 14:00 JST**: TR-03/05食糧・資源ライン演習。
- 結果は`Drill_Report_LM02_YYYYMMDD.md`に記録し、Audit Headerを付与。

## 7. リスクと緩和
- **電子押印障害**: 代替回線（衛星VPN）と紙押印セットをOpsRoomで管理。
- **契約更新漏れ**: `Contract Registry`に自動リマインダ（7日前/1日前）。
- **Trigger誤発動**: LM-01での二重承認フロー（Ops+Commander）を必須化。

## 8. 依存・連携
- LM-01: 閾値・アラートコードの同期。
- LM-03: OpsRoomでの押印進捗モニタリング。
- LM-04: MiniLateral条項の最新草案共有。
- LM-05: 法的告示文案のテンプレート統合。
- LM-07: 対外説明資料の共有（契約内容の表現統一）。

---
*Source Reference: Walpurgis関連Reports, THP作戦司令室プロトコル（War-Room）。*
