# LM-03 Financial C4ISR OpsRoom 仕様書

## Audit Header
- Project: THP-Hardening-LastOneMile
- Task ID: LM-03
- Version: 2025-09-17 v0.1
- Status: Draft (FREEZE遵守)
- Prepared: 2025-09-17 05:57 JST
- Prepared By: Codex Support (Ops Liaison)
- Review Window: 2025-09-17〜2025-09-19 (Commander Approval required for改訂)

## 1. 目的
THP雪玉監視体制を支える24/7オペレーションルームを立ち上げ、金融C4ISR（Command, Control, Communications, Computers, Intelligence, Surveillance, Reconnaissance）機能を実現する。OpsRoomはLM-01/02/05の監視・実行ハブとして、CCDCOEおよびFIRSTとの国際リエゾン窓口を統合する。

## 2. 施設・インフラ構成
| 領域 | 設備 | 備考 |
| --- | --- | --- |
| メインフロア | 6面ビデオウォール (4K) | 列1: LM-01 Dash, 列2: Ops KPIs, 列3: Geo feed |
| サーバラック | 2系統冗長 (UPS+発電) | データレイク/ETL/録画サーバーを配置 |
| 通信 | 専用光回線×2、衛星VPN×1 | CCDCOE/FIRSTホットラインは衛星VPN経由で暗号化 |
| セキュリティ | 多要素入室管理、電磁シールド | 入退室はWar-Roomログに自動記帳 |
| サポート | ブリーフィングブース×2、仮眠室×1 | 12h交代制を支援 |

## 3. 人員配置
| シフト | 時間 | 役割構成 |
| --- | --- | --- |
| Alpha | 08:00-20:00 JST | Ops Lead, Data Sentinel, Comms Officer, Legal Liaison |
| Bravo | 20:00-08:00 JST | Ops Lead, Data Sentinel, Infra Engineer, Liaison Officer |

- **Ops Lead**: 指揮官代理。Alert承認、Commander連絡。
- **Data Sentinel**: LM-01監視、Trigger検証、データ品質チェック。
- **Comms Officer**: CCDCOE/FIRST連絡、国内各省ハブ。
- **Legal Liaison**: LM-05連携、告示ドラフト進行。
- **Infra Engineer** (夜間): システム維持、障害対応。

## 4. SOP (War-Room同期)
1. **朝会 (09:00 JST)**: War-Roomプロトコル第2節`時点Ⅰ`に合わせて日次ブリーフ。過夜のアラートと未解決アクション確認。
2. **中間レビュー (15:00 JST)**: TriggerTable進捗を確認し、Contract Registry更新を点検。
3. **夜間引継ぎ (19:30 JST)**: Alpha→Bravo。Ops Lead間で指揮権交代。
4. **緊急ページ**: Critical Alert発生時、Ops LeadがCommander/War-Roomへ即時通報。
5. **レポート**: 毎日23:30 JSTまでに`OpsRoom_SITREP_YYYYMMDD.md`を作成し、Audit Header付与。

## 5. Escalation Tree
- **レベル0**: Watchアラート→Ops Lead確認。
- **レベル1**: Criticalアラート→Commander + LM-02/05責任者へページ。
- **レベル2**: Compoundアラート（Walpurgis Activation）→国家安全保障会議連絡、War-Room総責へ直通。
- **レベル3**: OpsRoom稼働不能→バックアップOpsRoom（地点B）へ移行。

Escalationログは`escalation_log.csv`として保存（audit_header含む）。

## 6. CCDCOE / FIRST リエゾン手順
| 項目 | CCDCOE | FIRST |
| --- | --- | --- |
| 連絡チャネル | NATO COSMIC Top Secret対応VPN (暗号化音声) | FIRST SecureBridge (TLSチャット) |
| 緊急コード | "Sleet" (情報共有依頼) / "Blizzard" (即応支援要請) | Priority-1 (重大インシデント) |
| 情報共有 | MTTP（Mitigation Tactics, Techniques, Procedures）を24h以内に相互配布 | 主要CERTへブリーフ転送 |
| 演習 | 月次テーブルトップ演習（次回: 2025-09-19 21:00 JST） | 四半期ドリルトーク (録音禁止) |

- OpsRoom Comms Officerがリエゾンログを`liaison_log_YYYYMMDD.jsonl`に追記。Audit Header必須。
- 国際情報の国内共有は、War-Roomプロトコルの「情報フロー層」に従い分類。

## 7. データ・システム統合
- LM-01ダッシュボードをウォールに常時表示、Alert発火時に自動ポップアップ。
- LM-02契約進捗を`Contract Registry`ダッシュに表示。押印完了状況をリアルタイムで可視化。
- `Ops Knowledge Base`をObsidian Vault内に配置。変更はCommander Approval。
- 監視カメラ映像と操作ログを24時間保管、72h経過後に暗号化アーカイブへ移送。

## 8. 監査要件
- 交代時に`Shift_Handover_Form`へ署名（電子ID）。
- システム変更は`Change Request`発行→Commander承認→実施→Audit Snapshot。
- 外部コミュニケーションは全て`comms_archive`に自動保存（E2E暗号化＋アクセス制御）。

## 9. ドライラン・テスト
- **T-12 (2025-09-18 11:00 JST)**: CCDCOE通信試験（"Sleet"コード）。
- **T-11 (2025-09-19 22:00 JST)**: FIRST Priority-1模擬インシデント。
- OpsRoom災害移行訓練はT-10までに実施（停電シナリオ）。

## 10. リスク / 緩和
- **通信断**: 衛星VPNと携帯衛星端末の二重化。
- **人員不足**: 予備要員リスト（3名）をWar-Roomで保持。病欠時は4h以内に補充。
- **情報漏洩**: 全端末にデータ損失防止(DLP)適用。持ち出しはCommanderサイン必須。

---
*Source Reference: War-Roomプロトコル、Walpurgis関連Reports、NATO/FIRSTガイドライン抜粋。*
