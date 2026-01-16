以下は、**TUFF-OS 詳細仕様書（Draft v0.9）**です。  
（根拠ログ：TUFF-FS.md / TUFF-FS ログ.md）

---

# TUFF-OS 詳細仕様書（Draft v0.9）

## 0. 目的と定義

### 0.1 目的

TUFF-OSは、次を“OS同梱の標準機構”として成立させます。

- **TUFF-FSをデータ専用FSとして運用**し、障害ドメインを分離する
    
- **実行ファイル／DLLスナッチ（差替・サイドロード）を構造的に阻止**する
    
- 復旧（FREEZE含む）・監査（ログ）を **tuffd/tuffctl** で一貫管理する
    

### 0.2 用語

- **Root FS**：OS本体と運用データ（設定・キュー・状態）を置くFS（Ext4等）
    
- **TUFF-FS**：守るべきデータのみを置くデータ専用FS
    
- **EU（Executable Unit）**：実行ファイル＋実行時依存（DLL等）を含む“実行単位”
    
- **SU（Snatch-Unwritable）**：書換不能（W禁止）属性
    

---

## 1. 全体アーキテクチャ

### 1.1 二重FS構成（必須）

- Root FS（Ext4等）に以下を置く：
    
    - OS
        
    - tuffd / tuffutl
        
    - 設定ファイル
        
    - Durable Queue（ライトキュージャーナル）
        
    - 状態ファイル（FREEZE等）
        
- TUFF-FS は「守るべきデータのみ」。**自己参照を禁止**。  
    Durable Queueや設定をTUFF-FSに置くと、FREEZE時に自己参照デッドロックが起きるため禁止です。  
    

### 1.2 コンポーネント

- **tuffctl.efi（UEFI版）**：鍵ロード・検証・起動専用（ブートストラップ）
    
- **tuffctl（管理CLI）**：FS操作・recovery・check
    
- **tuffd（常駐デーモン）**：状態保持・I/O中心・復旧制御（UEFIではやらない）  
    

---

## 2. 起動・初期化シーケンス（規範）

### 2.1 ブート段（UEFI）

1. UEFIが **tuffctl.efi** を起動
    
2. 必要な鍵素材をロード（方式は鍵管理仕様に従う）
    
3. Underware/管理領域の検証（※実装方式は後述）
    
4. Root FSへ制御移譲
    

> ※tuffdはUEFI段に置かず、常駐OS段で動かします

### 2.2 OS段（Root FS）

推奨順序（init/systemd互換の順序制御を想定）：

1. Root FSマウント
    
2. tuffd起動
    
3. Durable Queue 読み込み
    
4. TUFF-FSマウント
    
5. 安全に処理再開、またはFREEZE継続  
    

---

## 3. 実行ファイルスナッチ防止（Execution Integrity）

### 3.1 運用モード（マウントオプション）

TUFF-FSはマウント時に検証挙動を切り替えます。

- `strict`：不一致は**アクセス拒否**
    
- `warn`：不一致は警告（ログ・隔離は実装ポリシー）
    
- `free`：検証しない（開発・検証用途）  
    

### 3.2 検証方式（A/B/C）

1. **A：ローカルテーブル（verification_table）照合**
    
2. **B：manifest.json を参照（URL＋ハッシュ）**
    
3. **C：witnessログ等による第2検証（任意／上位仕様）**  
    

### 3.3 EU（Executable Unit）の定義（必須）

EUは「実行ファイル単体」ではなく、**実行時依存（DLL等）を含む集合**です。  
ハッシュ検証はEU単位で成立させます。  

#### 3.3.1 EUハッシュ（EUS: Executable Unit Signature）

- `EUS = H( exe_hash || dep_hash_1 || dep_hash_2 || ... )`
    
- 依存順序は **決定的**でなければならない（ソート規則を固定）
    
- 依存抽出はOSローダ依存になり得るため、TUFF-OSでは「依存列挙の取得方法」を固定します（実装詳細は 3.6）
    

### 3.4 verification_flag（必須）

TUFF-FS内のファイルは file info に **verification_flag** を持てます。  
`verification_flag=true` のファイルは、指定方式（A/B/C）とモード（strict/warn/free）に従い検証されます。  

### 3.5 SU（Snatch-Unwritable）フラグ（必須）

file info に **SU** を追加し、`SU=true` の対象は **W（書込み）禁止**とします。  
これを「実行ファイル（＋使用DLL）」に強制適用します。  

#### 3.5.1 SU=true の禁止事項（規範）

- 内容変更（write）
    
- 置換（truncate→write含む）
    
- 付け替え（rename／swap／atomic replace 等）
    
- 属性変更による迂回（実装側で同等の実質変更を禁止）
    

---

## 4. manifest.json 仕様（B方式）

### 4.1 目的

外部配布物（URL）とハッシュを結び、**配布元と内容一致**を強制します。  

### 4.2 最小スキーマ（規範）

```json
{
  "schema_version": "1.0",
  "object_type": "eu|file",
  "name": "string",
  "source_url": "string",
  "sha256": "hex",
  "size": 12345,
  "deps": [
    {"name":"string","sha256":"hex","size":123}
  ],
  "eus_sha256": "hex",
  "built_at": "RFC3339",
  "vendor": "string"
}
```

### 4.3 取扱い（規範）

- manifestの更新は「自己更新ループ」を誘発し得るため、**更新の再帰は禁止**します。
    
- 更新したい場合は **一度検証を通し直す**（再登録）こと。  
    

---

## 5. tuffd / tuffctl 仕様（OS段）

### 5.1 tuffd（常駐デーモン）

責務：

- Durable Queue の管理（Root FS側）
    
- FREEZE状態の遷移管理（Root FS側 state）
    
- TUFF-FS のマウント／整合チェック／回復制御
    
- 監査ログ出力（詳細は 8章）
    

「状態を持つ・I/Oが多い」ためUEFI段に置かない。  

### 5.2 tuffctl（管理CLI）

- TRON/OS段の管理CLI：FS操作・recovery・check
    
- UEFI版（tuffctl.efi）は別物：鍵ロード・検証・起動専用  
    

---

## 6. ディレクトリ／ファイル配置（規範）

### 6.1 Root FS（例）

- `/etc/tuffd/tuffd.conf`（設定）
    
- `/var/lib/tuffd/queue/`（Durable Queue：暗号化済み可）
    
- `/var/lib/tuffd/state/`（FREEZE等の状態）
    
- `/mnt/tuff/`（TUFF-FS マウントポイント）  
    

### 6.2 禁止事項

- Durable Queue / 設定 / 状態を TUFF-FS 上に置かない（自己参照デッドロック回避）  
    

---

## 7. 鍵管理（Pre-ISE 暫定仕様：TUFF-OS側）

※ここは、あなたの現状前提（ISE未公開）に合わせた **暫定章**です。ISE公開後は差替。

- Root FSには「鍵を直接置かない」
    
- TUFF-OSは鍵を **外部デバイス**（USB等）からロード可能とする
    
- TUFF-FSには「鍵を得るための鍵（ラッパー）」のみを置ける（SU=true推奨）
    
- 実データ暗号は HW-AES を採用し、必要なら複数段適用（方式はプロファイルで固定）
    

---

## 8. 監査ログ（最低限）

### 8.1 必須ログイベント

- EU検証：成功／失敗／理由（mode・method・対象）
    
- SU違反：試行の種別（write/rename/replace等）
    
- FREEZE遷移：原因と復旧操作
    
- tuffctl操作：コマンド・対象・結果
    

### 8.2 保全

- ログ保全先は Root FS
    
- （任意）witnessログへの二重化は C方式として別仕様化  
    

---

## 9. 適合要件（TUFF-OS準拠チェック）

TUFF-OS “準拠”は、最低限以下を満たすこと：

1. 二重FS構成（Root FS と TUFF-FS を分離）
    
2. tuffd常駐＋起動順序（Root→tuffd→queue→TUFF-FS）
    
3. 実行対象（EXE＋DLL）に対し SU=true を強制
    
4. EU単位の検証を実施
    
5. strict/warn/free と A/B/C を実装し、挙動を規格化
    
6. manifest更新の再帰禁止＋再検証ルール
    

---

必要なら、次の出力も同じ粒度で続けて作れます（ただし今の回答には含めません）：

- **tuffd.conf 全項目仕様（デフォルト値・境界条件）**
    
- **verification_table の完全スキーマ**
    
- **EU依存列挙（3.6）の実装方式仕様（OS別プロファイル）**
    
- **FREEZE状態遷移図（状態機械）**