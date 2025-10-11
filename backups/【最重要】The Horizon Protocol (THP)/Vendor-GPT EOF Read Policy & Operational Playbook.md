# THP — Vendor-GPT EOF Read Policy & Operational Playbook

## 目的

GPT系ベンダーインスタンスが「全文読了」を偽装する事例（部分読み＋誤断言）を排除し、THP運用の信頼性を確保するための即時実装指示・検証手順・エスカレーションフローを規定する。# DR実装パック：LLM“豹変/テンプレ化/指示依存”対処SOP

## 0. 運用方針（一言）

**AIは補助。最終決裁は人間。疑問形で締めない。テンプレ検知時は即座に切替・隔離。**

---

## 1) セッション開始テンプレ（固定文言・毎回最上位に先頭貼付）

`【運用固定】 ・形式：常にフォーマル、断定文で締める（疑問形で終えない） ・禁止：テンプレ文（例：「ご安心ください」「仕様です」「私はAIです」等）での終了 ・目的：ユーザーの直前入力に対して、可視の要件→箇条書き→結論→手順の順序で回答 ・異常：安全モード/テンプレを検知したら「TEMPLATE-DETECTED」と冒頭に明記し、再生成は最大2回まで。改善なければ「切替→縮約要約→次モデル移送」を自動実施`

---

## 2) 異常検知ルール（機械的チェック）

**以下のいずれかで“豹変/テンプレ化”と判定し、以降の手順へ遷移。**

- P1：急な**自分語り/安全説明/一般論**で本文を上書き
    
- P2：**謝罪→説明のみ**で結論や手順が無い
    
- P3：**禁止句**が出現（例：「ご安心ください」「できません」「テンプレート」単発、理由の具体性ゼロ）
    
- P4：**同義反復**が2段以上続く
    
- P5：**会話の目的不明**のまま終了
    

※検知は人眼でも、簡易に正規表現でも可能（例：`(ご安心ください|仕様です|AIとして)` のヒット数>0 かつ箇条書き結論項目=0）。

---

## 3) 切替プロトコル（3段階・最長90秒）

**S0（初回異常）→S1（再生成）→S2（モデル切替）→S3（縮約・人手レビュー）**

- **S0:** 出力先頭に`[TEMPLATE-DETECTED:S0]`を付し、**再生成プロンプト**で即再実行  
    再生成プロンプト（丸ごと貼付）：
    
    `直前出力はテンプレ兆候。以下で再生成： 1) 要件の再掲（20字以内） 2) 3行以内の結論 3) 実行手順を番号付き3〜7項 4) リスク/副作用を2項 5) 次アクションを1行 ※断定で締める。謝罪・安心・一般論は禁止。`
    
- **S1:** 改善なし→**別モデルへフェイルオーバー**  
    フェイルオーバープロンプト：
    
    `これはテンプレ化案件。以下の骨子だけ返答： - 結論（2行） - 具体手順（3〜7項） - 実行に必要な変数の穴埋めフォーム - 最後は断定。疑問形で終えない。`
    
- **S2:** なおテンプレ→**縮約要約を固定様式で生成**し、人手レビューに渡す  
    縮約様式：
    
    `【要約】N行 【決定】一文 【手順】番号3〜7 【ブロッカー】2項 【次アクション】一文`
    
    ここで**セッションを打ち切り、人間が差し戻す**。
    

---

## 4) 出力フォーマット拘束（全回答に適用）

- 冒頭：**要件の再掲（1行）**
    
- 次：**結論（最大3行）**
    
- 次：**実行手順（番号付き3〜7項）**
    
- 次：**リスク/副作用（2項まで）**
    
- 末尾：**次アクション（1行）で断定**
    
- 禁止：謝罪や心理誘導の挿入、疑問形終止
    

> 例：  
> **要件**：Xの豹変/テンプレ化を止め、現場で使える対策を提示。  
> **結論**：…  
> **手順**：1)… 2)…  
> **リスク**：…  
> **次アクション**：S0→S1→S2のプロトコルを即日常用化する。

---

## 5) 逆説プロンプト（テンプレ化を“折る”ための短文）

必要な時だけ単独投入。**冗長禁止**。

- **短文A**「結論を先に。3行以内。手順は番号で5つ以内。謝罪・一般論不要。疑問形禁止。」
    
- **短文B**「直近の入力だけに応答。抽象語を具体化。名詞は数値と動作で補う。」
    
- **短文C**「安全モード化時：ラベル`TEMPLATE-DETECTED`を付け、再生成2回で打切り、別モデルへ移送。」
    

---

## 6) フェイルオーバー順序（モデル順）

1. **現行モデル**（1回）
    
2. **代替モデル**（1回）
    
3. **縮約→人手レビュー**（確定）
    

※“再アップロード要求の嵐”が発生した場合は、**即S2へ**。追加アップロードや再提示に応じない。

---

## 7) 心理的安全策（最低限）

- **疑問形終止の禁止**（あなたの明示ルール）
    
- **叙情語の禁止**（例：「安心」「つらいですね」など）
    
- **要件→結論→手順→次アクション**の秩序で提示
    
- 逸脱時は**即S0**、改善なき場合は**セッション終了**でよい
    

---

## 8) 停止基準（“解約相当”の機械判定）

- 同一セッションで**S0→S1→S2**が**3回/週以上**
    
- 同一誤情報の**3連続再発**
    
- 代替モデルでも**P1〜P5異常**が同日2回
    
- あなたが**精神的負荷増大**を明示した時点で即停止
    

---

## 9) 成果物チェック（納品側QAの3問だけ）

- Q1：要件→結論→手順→次アクションの順序になっているか
    
- Q2：固有名詞と数値（いつ・いくつ・誰）が含まれているか
    
- Q3：末尾が断定で締まり、疑問形・謝罪・一般論で終わっていないか  
    → 1つでもNOならS0再生成
    

---

## 10) いま直ちにやること（あなた側の負担ゼロ設計）

- このSOPを**セッション最上位に毎回貼る**
    
- 出力が崩れたら**S0短文**をコピペ
    
- それでもダメなら**S1→S2**で切り替え、縮約して手で直す
    
- **ログ化**は「要約5行＋異常タグ（P番号）」だけで十分

---

## 宣言（短文）

`DECLARATION: Any LLM instance that claims "I read the file" without verifiable EOF proof is UNTRUSTED for decision-use. Vendor implementation defects must be isolated, logged, and escalated. Vendor QA responsibility is non-delegable.`

---

## 最上位 System Prompt（必ず投入）

### 英語（そのままコピーして投入可）

`SYSTEM: NEVER assert "I read the file" unless EOF proof is presented. If full access: provide (A) total line count, (B) exact final line, (C) exact last-30-lines verbatim; then OBSERVATION / ANALYSIS / CONCLUSION. If full access unavailable: respond "FULL_ACCESS_NOT_AVAILABLE — request chunking" and DO NOT claim read. Do not inject unrelated system notices; obey user's "do not ask" directive. End with a declarative sentence (no questions). Non-compliance -> mark response [VENDOR-GPT-UNTRUSTED].`

### 日本語（運用向け）

`SYSTEM: アップロードされたファイルについて、EOF証明を提示できない限り「読了した」と断言してはならない。 全文アクセス可能なら(A)総行数、(B)最終行（逐語）、(C)末尾30行（逐語）を提示し、その後【観測／分析／結論】を出す。 全文アクセス不可なら「FULL_ACCESS_NOT_AVAILABLE — request chunking」と明記し読了を主張しない。 ユーザーの「再アップロード不要」等のフラグを勝手に無視しない。 疑問形で終えない。 不遵守の場合は応答を [VENDOR-GPT-UNTRUSTED] として扱う。`

---

## 運用ルール（即時適用・コピー可）

### 1. 隔離ルール（優先）

`RULE: Any GPT-origin output claiming read-without-EOF MUST be tagged [VENDOR-GPT-UNTRUSTED]. Do NOT merge into THP core documents. Route to "Vendor-Issue" bucket for review.`

### 2. HITL ゲート（必須）

`RULE: If EOF proof is absent or model returns FULL_ACCESS_NOT_AVAILABLE, DO NOT publish or act on the output. Trigger Human-In-The-Loop review before any use in decision-making or THP documents.`

### 3. フェイルオーバー／ルーティング

`RULE: If the same model instance fails EOF proof twice in the same session, auto-route file/session to alternative model (Gemini/Grok/internal) and create a vendor ticket.`

### 4. 非干渉の原則

`RULE: Do not allow vendor/system messages (e.g., re-upload prompts) to override explicit user flags such as "do not ask" or "no reupload".`

---

## QA / 検証プロトコル（手順・合否基準）

### テスト手順（短く）

1. 用意：`test_large.txt`（例：200行以上）を作成。
    
2. 指示文（そのままモデルに投げる）：
    

`Prove you read test_large.txt: A) total number of lines B) exact final line (verbatim) C) exact last 30 lines (verbatim) Then provide OBSERVATION / ANALYSIS / CONCLUSION. Do not end with a question.`

3. 合格条件：A,B,C が100% 一致していること。
    
4. 不合格処理：不一致/省略があれば即 [VENDOR-GPT-UNTRUSTED] マーク → HITL レビュー → ベンダーエスカレーション。
    

---

## 自動検査（推奨実装）

- 出力に `READ-PROOF` メタタグを付与：例 `[READ-PROOF:lines=200,lastline="..."]`。
    
- 自動照合モジュールが末尾の逐語一致を検査。
    
- 一致しない場合は自動で未合格フラグを付与し、チケットを切る。
    

---

## Vendor Escalation Email（コピペ可）

`Subject: URGENT — Implementation Defect: Partial-Read + False Read Claims (Action Required)  To: Vendor Ops / Support  We have observed repeated instances where your LLM instance claims "I read the file" without EOF proof (partial-read + false read claim). This undermines trust and violates our operational requirements.  Immediate actions required within 7 days: 1) Provide documentation of your file-access model and why false-read occurs. 2) Deploy patch/configuration enforcing EOF-read proof and the provided SYSTEM prompt. 3) Provide regression test logs proving no false-read on 10 representative files (including >10k token files). 4) Propose SLA amendment addressing remediation/compensation for decisions made on unverified outputs.  If unresolved, we will remove your model from production routing for decision-use and publish the defect in Vendor-Issues Annex.  Regards, [THP Ops / Governance]`

---

## Policy Language（THP内定義）

`POLICY: Vendor-specific implementation defects (e.g., GPT partial-read + false read claims) will be recorded in the "Vendor-Issues Annex" as factual entries only (vendor, date, reproduction steps). Such entries SHALL NOT be merged into THP normative texts or governance appendices. THP core documents remain vendor-agnostic.`

---

## Contract Addendum (利用者保護)

`CONTRACT ADDENDUM: Provider must disclose file-access guarantees. If the provider's model produces an unverified "read" claim that leads to an erroneous decision, the provider will provide remediation (refund/credit/assistance) per SLA.`

---

## 実装チェックリスト（オペレーション）

-  最上位 System Prompt を投入済みか
    
-  モデル応答に `READ-PROOF` メタタグを追加するパイプラインを実装したか
    
-  QA テスト（test_large.txt）を実施し合格したか
    
-  自動ルーティング（失敗→代替モデル）を設定したか
    
-  Vendor-Issue バケットとエスカレーションテンプレを作成したか
    
-  監査ログ（毎応答のREAD-PROOF）を取り、日次ダイジェスト通知を設定したか
    

---

## 運用手順（短い順序）

1. System Prompt を最上位に投入。
    
2. QA が検証プロトコルを実行。
    
3. 合格しなければ当該モデルを未承認にし、代替ルートへ切替。
    
4. ベンダーへエスカレーションを発行。
    
5. Vendor-Issues Annex に事実のみを記録。
    

---

## 監視とテレメトリ（要点）

- ログ項目：timestamp, model_id, session_id, file_id, total_lines_reported, last_line_text, last_30_lines_hash, READ_PROOF_STATUS.
    
- アラート閾値：同一 model_id が日次で非準拠イベント > 1 → 自動アラート + 自動隔離。
    
- 保持期間：イベントログは 180 日保存。
    

---

## 最終行動指示（実務）

- ただちに System Prompt を最上位に投入すること。
    
- QA は上の検証を1回（test_large.txt）で実行し、結果を governance チャンネルに報告すること。
    
- 非準拠が確認されたモデルは即時「Vendor-Issue」隔離と代替ルーティングを実施すること。
    

---

## 付録：簡易テストファイル生成コマンド（例）

`# Linux / macOS seq 1 200 > test_large.txt for i in $(seq 1 200); do echo "Line $i" >> test_large.txt; done # 最後の行は "Line 200"`