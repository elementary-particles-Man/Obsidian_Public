# 官報掲載文（最終版）v1

## Audit Header
- Project: THP-Hardening-LastOneMile
- Task ID: LM-05
- Document: LM-05_Official_Gazette_Final_Text
- Version: 2025-09-18 v1.0
- Status: Final (Awaiting Commander Approval ID)
- Prepared: 2025-09-18 05:51 JST
- Prepared By: Codex Support (Ops Liaison)
- Reviewed By: MoJ 官報室、各省庁 Liaison

---

### 告示第〇〇号　緊急財務トリガーの適用について

#### 第一条（目的）
国際金融市場の急激な変動および供給網寸断リスクに対応するため、財務省・金融庁・関係省庁は THP-Hardening-LastOneMile 計画（以下「本計画」）に基づき、危機ダッシュボード（LM-01）および 72h Toolkit（LM-02）が提示する臨界指標（TriggerTable）の発動時に即応措置を行う。

#### 第二条（適用範囲）
1. Trigger Code TR-01 から TR-06 までの臨界指標に該当する事象が発生した場合に適用する。
2. 対象機関は財務省、内閣官房、経済産業省、総務省、農林水産省、国土交通省、外務省、関係独立行政法人および指定公共機関とする。
3. 各機関は、本告示の適用時に Audit Header を付した措置記録を `promulgation_log.jsonl` に 24 時間以内に登録する。

#### 第三条（臨界指標および初動措置）
| Trigger Code | 監視指標 | 発動閾値 | 初動措置（T+0〜T+6h） | 担当 |
| --- | --- | --- | --- | --- |
| TR-01 Treasury | 10Y/30Y 入札テール差、Bid-to-Cover、PD Allocation | Tail ≥ 12bp または Bid-to-Cover ≤ 2.0 | 国債入札条件調整、財政投融資臨時枠の凍結、LM-02 契約班通知 | 財務省・金融庁 |
| TR-02 Market Vol | MOVE Index、Subprime Auto ABS OAS | MOVE ≥ 180 かつ OAS ≥ +300bps | CCP リスク会合招集、資本バッファ暫定引上げ案起案 | 金融庁・取引所 |
| TR-03 Energy & Food | Brent ≥ $150、Wheat Index ≥ +120% YoY | 閾値到達後 1 時間以内に備蓄放出シナリオ起動 | 経済産業省・農林水産省 |
| TR-04 FX Buffer | CNH-CNY Spread ≥ 0.040、PBOC FX Reserve ≤ $2.8T | MiniLateral 回廊準備命令、為替安定オペ案起草 | 財務省・外務省 |
| TR-05 Parallel FX | エジプト／ナイジェリア並行市場プレミアム ≥ 40% | JBIC/NEXI 緊急保証枠拡張通知 | 経済産業省・NEXI/JBIC |
| TR-06 NATO Sentinel | NATO Eastern Sentinel 配備レベル | Critical 判定 | 国境輸送回廊の移行、CCDCOE/FIRST 連携起動 | 内閣官房・外務省 |

#### 第四条（配布および告示 ID 管理）
1. 告示 ID は `distribution_id_registry.jsonl` において予約・承認・確定を行い、Commander 承認 ID を併記する。
2. 告示本文および PDF 版の冒頭に告示 ID を明記し、版管理タグ（例：Rev-A）を付す。
3. 配布ログは `distribution_log.jsonl` に `timestamp, notice_id, recipient, channel, ack_deadline, audit_header` を記録し、24 時間以内に受領確認を取得する。

#### 第五条（監査および失効）
1. 告示発効後 72 時間以内に関係省庁連絡会議を開催し、継続要否を審議する。継続する場合は改訂案を作成し Commander 承認を得る。
2. 告示失効時は `distribution_log.jsonl` の該当エントリに `status: "expired"` を追加し、総括報告を `Legal_Audit_Report` に記載する。
3. 関連政省令・告示の緊急改正が必要な場合、所管大臣は Commander 承認を得て直ちに改正手続を開始する。

---
*Reference: LM-05_Official_Gazette_Draft_v1.md、LM-05_Distribution_Procedure.md、TriggerTable_v1.xlsx。*
