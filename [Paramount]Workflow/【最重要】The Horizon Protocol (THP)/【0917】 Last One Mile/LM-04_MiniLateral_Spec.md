# LM-04 MiniLateral Backup Rails MoU 仕様書

## Audit Header
- Project: THP-Hardening-LastOneMile
- Task ID: LM-04
- Version: 2025-09-17 v0.1
- Status: Draft (FREEZE遵守)
- Prepared: 2025-09-17 06:01 JST
- Prepared By: Codex Support (Ops Liaison)
- Review Window: 2025-09-17〜2025-09-19 (Commander Approval required for改訂)

## 1. 目的
米国債入札不成立と地政学的断絶を想定し、ミニラテラル協議体（日本・ポーランド・リトアニア・チェコ・韓国）とのバックアップ決済レールと物流確保の合意文書（MoU/Exchange of Notes）を締結する。MiniLateral構造はWar-Room報告の国境封鎖データ（ポーランド分析）を反映し、資源・食糧・安全保障のバックストップを提供する。

## 2. MoU 構成
1. **前文**: ワルプルギス複合危機と雪玉監視体制の認識共有。
2. **定義**: バックアップレール、緊急決済ノード、優先輸送回廊。
3. **協力範囲**:
   - 金融: バックアップ決済（JPY/EUR/KRWスワップライン）。
   - 物流: 中間回廊・北極航路のコンテナ枠確保。
   - 情報共有: OpsRoom↔各国危機センターのリアルタイムデータ交換。
4. **発動条件**: TriggerTable(TR-04, TR-06)連動、ポーランド国境 throughput ≤30%、NATO米軍不在。
5. **指揮統制**: 各国コンタクトポイント、OPS連携マトリクス。
6. **法的効果**: Exchange of Notes付属、国内緊急命令の根拠条項一覧。
7. **監査・情報保護**: Audit Header付通信、分類レベル（"雪玉"）。
8. **期限・更新**: 初期効力12ヶ月、72hロールバックポリシー準拠。

## 3. 調整フロー
| ステップ | 内容 | 主担当 | 期限 |
| --- | --- | --- | --- |
| Step1 | MoUドラフト共有（日本→各国） | MOFA国際局 | T-11 (2025-09-19) |
| Step2 | 法務レビュー & 翻訳整備 | 各国外務・法務 | T-10 |
| Step3 | 連絡ポイントテーブル確定 | OpsRoom Comms Officer | T-9 |
| Step4 | Exchange of Notes草案作成 | 日本-ポーランド共同 | T-8 |
| Step5 | Commander Approval & 署名セレモニー設定 | MOFA+JIMS | T-6 |

- ステップ各完了時に`MoU_Progress_Log.jsonl`へ記録。

## 4. 署名・押印体制
- **署名者**: 各国外務次官または指定代理。
- **押印**: 電子署名（国際相互運用方式）。バックアップとして現地大使館で紙署名。
- **証書交換**: デジタル Exchange of NotesをOpsRoom経由で暗号化送信、紙は外交パウチ。
- **保管**: Obsidian Vault内`/MoU/signed/`に格納、Audit Header付メタ。

## 5. 連絡先・通信プロトコル
| 国 | 危機センター | 連絡手段 | 備考 |
| --- | --- | --- | --- |
| 日本 | THP OpsRoom | SecureLine + 衛星VPN | LM-03運用 |
| ポーランド | Government Centre for Security | NATO VPN + 独自暗号音声 | Border data feed提供 |
| リトアニア | National Crisis Management Centre | EU-Resilience Network | Baltic経路優先割当 |
| チェコ | Ministry of Finance War Room | EU TIBER通信用VPN | 金融スワップ連携 |
| 韓国 | Financial Security Institute | FIRST SecureBridge | サプライ再配置支援 |

- 通信ログは`mou_liaison_log_YYYYMMDD.jsonl`へ記録。

## 6. リスク評価 & 条項
| リスク | 対応条項 | 緩和策 |
| --- | --- | --- |
| 国境封鎖長期化 | 第III条 (物流) | 中間回廊シェアリング、代替港湾確保 |
| 通貨スワップ枠不足 | 第II条 (金融) | JPY/EUR/KRW/PLNスワップライン上限の段階引上げ |
| 政治的反発 | 第V条 (広報) | 公開Q&Aテンプレート（LM-07連携） |
| 情報漏洩 | 第VI条 (保護) | E2E暗号化、War-Room監査、アクセス制御 |

## 7. 監査・承認
- Commander Approval IDをExchange of Notesに埋め込み。
- 署名後72h以内に`Audit Snapshot`を作成し、War-Room監査隊へ送付。
- 3ヶ月ごとにMoU見直しレビュー会議（OpsRoom主催）。

## 8. 演習計画
- **T-9 (2025-09-21)**: MiniLateral通信テーブルトップ演習。
- **T-6 (2025-09-24)**: Exchange of Notes署名前ドライラン（ドキュメント交換）。
- 演習結果は`MiniLateral_Drill_Report_YYYYMMDD.md`に記録。Audit Header必須。

## 9. 連携
- LM-02: TriggerTable TR-04/TR-06でMoU発動定義。
- LM-03: OpsRoomが連絡ポイントの実動管理。
- LM-05: Exchange of Notesの国内法位置づけ告示案を作成。
- LM-07: 対外説明資料整備。

---
*Source Reference: ポーランド国境封鎖分析、War-Roomプロトコル、Walpurgis関連Reports。*
