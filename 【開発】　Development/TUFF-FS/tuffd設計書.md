了解しました。  
では **tuffd 状態遷移図（設計確定版）**を、  
**実装にそのまま落とせる意味論つき**で提示します。  
（ルートFSの種類は前提に含めません／4096Bチャンクのみ前提）

---

# tuffd 状態遷移設計

## 前提整理（固定）

- 書き込みは **API時点で AES-256 済み**
    
- tuffd は **write-queue と Durable Queue を管理**
    
- **commit が来ない限り真実化しない**
    
- crash / kill / 電断は常態
    
- tuffd は **自律判断しない**
    

---

## 状態一覧（最小・十分）

```text
INIT
NORMAL
WARN
FREEZE
PENDING_ONLY
SHUTDOWN
```

---

## 状態定義

### 1. INIT

**起動直後の初期状態**

- Durable Queue の存在確認
    
- 前回異常終了フラグ確認
    
- 未処理キューの有無を検査
    

**遷移条件**

- 未処理キューなし → NORMAL
    
- 未処理キューあり → PENDING_ONLY
    
- 不整合検出 → FREEZE
    

---

### 2. NORMAL

**通常稼働状態**

- RAM Queue 受付：可
    
- Durable Queue 追記：条件付き
    
- 実 I/O 実行：可（アイドル時）
    
- 読み取り：常時可
    

**遷移条件**

- キュー滞留超過 → WARN
    
- 内部異常（I/O失敗等） → FREEZE
    
- SIGTERM → SHUTDOWN
    

---

### 3. WARN

**警告状態（継続可能）**

- RAM Queue 受付：可
    
- Durable Queue 追記：**強制**
    
- 実 I/O 実行：可（低速）
    
- 読み取り：可
    

**典型トリガ**

- RAMキュー長 > 閾値
    
- RAM滞留時間 > 閾値
    
- Durable Queue サイズ逼迫
    

**遷移条件**

- 状況改善 → NORMAL
    
- 悪化 → FREEZE
    
- SIGTERM → SHUTDOWN
    

---

### 4. FREEZE

**安全停止状態**

- RAM Queue 受付：**不可**
    
- Durable Queue 追記：**不可**
    
- 実 I/O 実行：不可
    
- 読み取り：可
    
- 状態通知のみ
    

**意味**

- 「これ以上進めると壊れる」
    

**解除条件**

- SU による `tuffutl commit`
    
- SU による `tuffutl truncate`
    
- SU による `tuffutl resume`
    

※ tuffd 自身は解除しない

---

### 5. PENDING_ONLY

**未確定キュー保持状態**

- RAM Queue 受付：不可
    
- Durable Queue 読み取り：可
    
- 実 I/O 実行：不可
    
- 読み取り：可
    

**典型トリガ**

- crash 後再起動
    
- Durable Queue に未処理エントリあり
    

**遷移条件**

- SU `commit` → NORMAL
    
- SU `truncate` → NORMAL
    
- SU 明示指示なし → 継続
    

---

### 6. SHUTDOWN

**正常終了状態**

- RAM Queue flush（Durable Queueへ）
    
- 実 I/O 停止
    
- 状態保存
    

---

## 状態遷移図（ASCII）

```text
          +------+
          | INIT |
          +--+---+
             |
     +-------+--------+
     |                |
  no pending       pending
     |                |
     v                v
 +--------+      +--------------+
 | NORMAL |<---->| PENDING_ONLY |
 +---+----+      +------+-------+
     |                    |
     | warn                | SU commit/truncate
     v                    v
  +------+           +--------+
  | WARN |---------->| NORMAL |
  +--+---+           +--------+
     |
     | fatal / unsafe
     v
 +--------+
 | FREEZE |
 +---+----+
     |
     | SU commit / truncate / resume
     v
 +--------+
 | NORMAL |
 +--------+
```

---

## 設計上の重要ポイント（固定）

### 1. 自動復帰は存在しない

- FREEZE
    
- PENDING_ONLY
    

から **自動で NORMAL に戻ることはない**

---

### 2. 状態は「安全側」にしか遷移しない

- NORMAL → WARN → FREEZE は自動
    
- 逆方向は **人間のみ**
    

---

### 3. crash 後の意味論

- データは壊れていない
    
- ただし **未確定**
    
- 状態として PENDING_ONLY に落とす
    

---

## 実装チェックリスト（そのまま使える）

-  起動時に INIT → 判定
    
-  状態は単一 enum
    
-  状態遷移は1箇所で集中管理
    
-  FREEZE/PENDING_ONLY では I/O 実行禁止
    
-  commit/truncate/resume 以外で解除不可
    

---

## 総括

この状態遷移は、

- RAMキュー消失
    
- 電断
    
- OSクラッシュ
    
- 管理者判断遅延
    

すべてを **「壊さず止める」**方向に吸収します。

TUFF-FS / tuffd の設計として、  
**これ以上削ると危険、これ以上増やすと呪物**  
というちょうど良い位置です。