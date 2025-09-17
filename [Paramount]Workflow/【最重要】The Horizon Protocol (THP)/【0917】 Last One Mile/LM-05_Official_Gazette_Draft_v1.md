# 官報掲載草案（緊急財務トリガー告示）v1

## Audit Header
- Project: THP-Hardening-LastOneMile
- Task ID: LM-05
- Document: LM-05_Official_Gazette_Draft_v1
- Version: 2025-09-18 v1.0-draft
- Status: Draft (Commander Approval Pending)
- Prepared: 2025-09-18 04:52 JST
- Prepared By: Codex Support (Ops Liaison)
- Review Window: 2025-09-18〜2025-09-20

---

### 告示第〇〇号　緊急財務トリガーの適用について

1. 本告示は、国際金融市場における著しい変動並びに同時多発的な供給寸断リスクに対応するため、財務省・金融庁・関係省庁による統合危機対応措置を速やかに発動することを目的とする。
2. THP-Hardening-LastOneMile 計画（以下「本計画」という）に基づき、危機ダッシュボード（LM-01）および72h Toolkit（LM-02）が生成する臨界指標（TriggerTable）を官報上で告示し、各府省庁が速やかに所掌措置を実施できるようにする。
3. 本告示は、告示の日から効力を生じ、Commander Approval による失効指示または解除通知が発出されるまで有効とする。

### 第一条　適用範囲
- 本告示は、Trigger Code TR-01 から TR-06 までの臨界指標に該当する事象が発生した場合に適用する。
- 適用対象は、財務省、内閣官房、経済産業省、総務省、農林水産省、国土交通省、外務省、関係独立行政法人および指定公共機関とする。
- 各省庁は、本告示の適用に伴い、Audit Header を付した措置記録を所管の監査ログ（`promulgation_log.jsonl`）へ24時間以内に登録するものとする。

### 第二条　臨界指標および初動措置
| Trigger Code | 監視指標 | 発動閾値 | 初動措置（T+0〜T+6h） | 担当省庁 |
| --- | --- | --- | --- | --- |
| TR-01 Treasury | 10Y/30Y 入札テール差、Bid-to-Cover Ratio、PD Allocation | Tail ≥ 12bp または Bid-to-Cover ≤ 2.0 | 国債入札条件調整、財政投融資特別枠の凍結、LM-02 契約班への発動通報 | 財務省・金融庁 |
| TR-02 Market Vol | MOVE Index、Subprime Auto ABS OAS | MOVE ≥ 180 かつ OAS ≥ +300bps | CCPリスク会合招集、資本バッファ暫定引上げ案起案 | 金融庁・取引所 |
| TR-03 Energy & Food | Brent ≥ $150、Wheat Index ≥ +120% YoY | 閾値到達後1時間以内に備蓄放出シナリオを起動 | 経済産業省・農林水産省 |
| TR-04 FX Buffer | CNH-CNY Spread ≥ 0.040、PBOC FX Reserve ≤ $2.8T | MiniLateral 回廊の準備命令、為替安定オペの指示草案起案 | 財務省・外務省 |
| TR-05 Parallel FX | エジプト・ナイジェリア並行市場プレミアム ≥ 40% | 保証供与枠の拡張、JBIC/NEXI 緊急保証の適用通知 | 経済産業省・NEXI/JBIC |
| TR-06 NATO Sentinel | NATO Eastern Sentinel 配備ステータス | Critical 判定 | 国境輸送回廊移行、CCDCOE/FIRST 連携発動 | 内閣官房・外務省 |

> 備考: 各 Trigger の詳細条件は `TriggerTable_v1.xlsx`（LM-02）および危機ダッシュボード仕様（LM-01）を参照のこと。

### 第三条　告示後の手続
1. 各省庁は、初動措置の実施状況を Commander 承認IDおよび当該Triggerコードを付した監査記録として、`promulgation_log.jsonl` に追記する。
2. 告示発効後72時間以内に、関係省庁連絡会議を開催し、継続要否を審議する。継続が必要な場合は、Commander 承認の下で改訂告示草案を別途作成する。
3. 告示失効または解除時には、各省庁は実施結果を含む総括報告を `Legal_Audit_Report` としてまとめ、War-Room 監査隊へ送付する。

### 第四条　広報および周知
- 本告示の概要は、官報電子版・各省庁内イントラネット・指定公共機関向け暗号化ポータルに同時掲載する。
- 一般公開用の要約版は THP Comms（LM-07）のテンプレートを使用し、政治的敏感情報を除いた形で作成する。
- 告示抄録の一次配布ログは `distribution_log.jsonl` に Audit Header 付きで記録する。

### 第五条　付則
1. 本告示の有効期間中、関連する政省令・告示の緊急改正が必要な場合、当該所管大臣は Commander 承認を得た上で直ちに改正案を起草し、内閣法制局との協議を開始する。
2. 本告示の発効から30日以内に、実施結果と改善策を取りまとめた事後監査報告書を作成し、Commander に提出する。
3. 本告示に定めのない事項は、本計画の司令部指示に従うものとする。

---
*Reference: LM-05 Legal Triggers Promulgation 仕様書（2025-09-17 v0.1）、LM-01_Dashboard_Spec.md、LM-02_Toolkit_Spec.md。*
