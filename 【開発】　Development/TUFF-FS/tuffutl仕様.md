了解しました。  
ここまで確定した内容をすべて統合し、**実装にそのまま渡せる形**で  
**TUFF-FS / tuffutl 仕様書（Draft v0.1）**を作成します。  
※新規提案・思想追加は一切行っていません。確定事項のみです。

---
# TUFF-FS / tuffutl Specification

## Draft v0.1 — **Keyname / AES256 対応確定版**

---

## 【全体修正ポリシー】

- **ISE / ISE鍵 / ISEチャンク等の文言は全削除**
    
- 暗号方式は **AES-256（標準HWアクセラレーション前提）に統一**
    
- 鍵はすべて **KeyFile 管理（/root/TUFF.key）**
    
- FS 内に平文鍵は存在しない
    

---

## 1. 暗号仕様（置換）

### 1.1 暗号方式

- TUFF-FS におけるデータ暗号化は **AES-256** を使用する
    
- 暗号モード・IV 生成方式は実装依存とするが、
    
    - 同一鍵・同一チャンクでの IV 再利用は禁止
        
- HW AES 命令（AES-NI 等）の利用を前提とする

- マスターキー（以降MK）以外のカスタムキーも使用可能とするが、この場合はMKでのAESに続いてカスタムキーによるAESを重複で実行する。

---
## 0. 目的と位置づけ

`tuffutl` は **TUFF-FS を安全に運用するための唯一の管理インタフェース**である。  
ユーザは TUFF-FS 上での構造変更・冗長性管理・削除確定を  
`tuffutl` を通じてのみ行う。

- mkfs / mount / fsck / mkdir / rmdir 等の直接操作は許可しない
    
- 権限・鍵・冗長性・削除意味論を **構造で強制**することを目的とする
    

---

## 1. 基本設計原則

- 論理ブロックサイズ：**4096 バイト固定**
    
- すべての構造は 4096B チャンク単位で管理
    
- 冗長性・ISE・監視は **ディレクトリ単位で支配**
    
- 即時破壊操作を排除し、**commit に責任を集約**
    
- 一般ユーザは「速さ」を選べるが「保護」は選べない
    

---

## 2. 権限モデル

|区分|内容|
|---|---|
|User|一般ユーザ|
|Owner|ファイルオーナー|
|SU|ルートファイルシステム管理者|

- 冗長性確定・削除確定は **SU のみ**
    
- 一般ユーザは write / sync のみ可能
    
- 鍵管理は **FS 外責任**
    

---

## 3. 鍵運用仕様

### 3.1 Master Key (MK)

- MK は **tuffutl 内部でのみ使用**
    
- コマンドライン・環境変数での直接指定は禁止
    
- 既定保管先：  
    `/root/TUFF.key`
    

### 3.2 権限制御

- `/root/TUFF.key` は **SU のみ RW**
    
- SU が chmod 等で緩和した場合の責任は仕様外
    

---
### 3.3 KeyFile 構造（論理）

`/root/TUFF.key` は以下の論理構造を持つ：

`[Master]   MK_Fingerprint = SHA256(...)  [Keys]   <keyname_1> = SHA256(auto-generated AES key)   <keyname_2> = SHA256(auto-generated AES key)   ...`

- `keyname` は **人間可読な識別子**
    
- 実体鍵は
    
    - 自動生成された乱数
        
    - その **SHA-256 ハッシュのみを保存**
        
- 生鍵は **プロセスメモリ上にのみ存在**
---

## 4. 提供コマンド一覧

### 4.1 `tuffutl init`

**目的**

- TUFF-FS パーティション作成
    
- 4096B 論理フォーマット初期化
    
- Initial Chunk（3N）作成
  
- /root/TUFF.key作成（別ファイルシステム前提、SUのみRW権限）
    

**権限**

- SU のみ
    

---

### 4.2 `tuffutl mount` / `tuffutl umount`

**目的**

- TUFF-FS のマウント／安全なアンマウント
    

**権限**

- SU のみ
    

---

### 4.3 `tuffutl status`

**目的**

- FS 状態の可視化
    

**権限**

- User / SU
    

**表示例**

- write-queue 状態（NORMAL / WARN / FREEZE）
    
- 冗長性ペンディング数
    
- Hidden / DELETE_PENDING 数
    

---

## 5. ディレクトリ操作
### 5.1 `tuffutl mkdir`（更新）

`tuffutl mkdir (--0 | --1 | --1p | --2 | --2p) \               [--keyname <string>] \               <path>`

#### 追加オプション

- `--keyname <string>`
    
    - ディレクトリ専用 AES-256 鍵を指定
        
    - 指定された文字列に対応する鍵を **自動生成**
        
    - 生成した鍵の **SHA-256 を KeyFile に登録**
        

#### 動作仕様

- `--keyname` 指定時：
    
    1. `<string>` が KeyFile 内に **存在しない**ことを確認
        
    2. 新規 AES-256 鍵を生成
        
    3. SHA-256(key) を `/root/TUFF.key` に追記
        
    4. ディレクトリ属性として `KEY_REF=<string>` を設定
        
- `<string>` が既存の場合：
    
    - **エラーを返して異常終了**
        
    - ディレクトリは作成されない
        

#### 制約

- `--keyname` は **mkdir 時のみ指定可能**
    
- 後からの追加・変更は禁止
    
- 省略時は **デフォルト鍵（MK 派生）**を使用
    

---

### 5.2 `rmdir`（更新）

- `rmdir` 自体は鍵操作を行わない
    
- ただし Hidden / DELETE_PENDING 化されたディレクトリは
    
    - **対応する keyname を保持したまま凍結**
        
- 実削除（commit / cleanup）時にのみ、
    
    - 当該 keyname に対応するチャンクを安全に解放

---

## 6. ファイル操作意味論

### 6.1 `cp`

- 同一 TUFF-FS 内：  
    **Index 再所属 + 冗長性適合**
    
- 異なる FS：通常コピー
    
- 実 IO は write-queue に積むのみ
    

---

### 6.2 `mv`

- 同一 TUFF-FS 内：  
    **Index チャンク情報のみ変更**
    
- 異なる FS：cp + rm
    

---

### 6.3 `rm`

|親ディレクトリ|動作|
|---|---|
|0N / 1N|即時削除|
|≥1N+P|Hidden + DELETE_PENDING|

---

## 7. `--sync` オプション

### 7.1 適用範囲

- cp / mv / write 操作
    
- **rm / rmdir には無効**
    

### 7.2 動作定義

- write-queue を経由せず **Direct I/O**
    
- **TEMP_1N モード**で動作
    
- 冗長チャンクは：
    
    - 生成しない
        
    - 書き換えない
        
    - 破壊しない
        

### 7.3 権限別挙動

|実行者|冗長反映|
|---|---|
|Owner|不可|
|Write権限のみ|不可|
|SU|任意（既定：不可）|

冗長性反映は **commit 時のみ確定**

---

## 8. Hidden / Pending 状態

### 状態フラグ

- HIDDEN
    
- DELETE_PENDING
    
- REDUNDANCY_PENDING
    

### 振る舞い

- 読み書き不可
    
- rename / mv 不可
    
- commit / cleanup のみで確定
    

---

## 9. `ls -pend`

```bash
ls -pend <path>
```

- TUFF-FS 上のみ有効
    
- ペンディング状態を可視化
    

表示例：

```
fileA  [PENDING: redundancy]
fileB  [PENDING: delete-request]
```

---

## 10. commit / truncate / cleanup

commit/truncateは、引数でパスを指定して部分的にコミットができるようにする。また、カスタムキー適用のフォルダについては、引数keynameとしてカスタムキー名を必須とする（ない場合は異常終了）

### 10.1 `tuffutl commit`

- SU + 正規 KeyFile 必須
    
- 冗長性反映
    
- Hidden 削除確定
    
- Index 世代更新
    

### 10.2 `tuffutl truncate`

- SU
    
- write-queue 破棄
    
- 状態巻き戻し
    

### 10.3 `tuffutl cleanup`

- SU + 正規 KeyFile
    
- 物理削除
    
- 空き領域回収
    
- scrub 実行
    

---

## 11. リンク仕様

- **ハードリンク：全面禁止**
    
- **シンボリックリンク：許可**
    
    - Index エントリのみ
        
    - 冗長性・属性はリンク先に従う
        
    - 変更不可
        

---

## 12. FREEZE 状態

- Direct I/O 停止
    
- write-queue 受付のみ
    
- 読み取り可
    
- commit / truncate / cleanup 可
    

---

## 13. 仕様の範囲外

- 鍵紛失時の復旧
    
- SU 権限乱用
    
- 権限緩和後の事故
    
- HW 故障の物理復旧（ただしイニシャルチャンクとインデックスチャンクは3N構成とし、常駐プロセスにより随時同一性を保証、同一ではない場合、システムアラート発出後、多数決によって異常とされたチャンクをHW検査し、異常なければ上書き、HW障害検知時点でアラートを出し、縮退運用とする）
    

---

## 14. 状態

本仕様は **TUFF-FS / tuffutl Draft v0.1** とする。  
構造・意味論・権限境界は固定とし、  
数値・表示形式・最適化は実装段階で調整可能とする。
