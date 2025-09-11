# ISE: Indeterminate Signature Encryption - 恭順暗号方式ドラフト仕様書

## 概要

**ISE（Indeterminate Signature Encryption）**は、従来の暗号技術において前提とされてきた「正当性の保証」ではなく、**「否認可能性と不可判別性」**を中核に据えた新しい暗号設計思想です。ISEでは、**「真であることを唯一知ることができる者のみが真と知ることができる」**という構造を採用し、暗号の役割を秘密の保持から「真実の独占的理解」へと転換します。

---

## コンセプトの中核

- **暗号強度ではなく構造による守秘**。
- どの鍵でもデータは復号可能 → 偶然“正しい結果”に到達しても、それが真である保証が存在しない。
- 唯一の判定要素は「**真の鍵**」と一致する「**真のシグネチャ**」。
- ランダマイザによりデータ出力の多様性を確保し、判定基準を不可能化。
- 全ての出力は整合的に見えるが、**それが“本物”かどうかは本人以外に分からない**。

---

## システム構成図（フロー）

```mermaid
flowchart LR
    A[真の鍵 (K_true)] --> B[暗号化 Encrypt]
    B --> C[暗号データ (C)]
    A --> D[署名生成 Sign(K_true)]
    D --> E[真の署名 (S_true)]
    A --> F[ランダマイザ選択 (RID)]
    F --> C
    C --> G[復号 Decrypt(K_any)]
    G --> H[ランダマイザ適用]
    H --> I[出力データ]
    K[K_any] --> J[署名生成]
    J --> I
```

---

## 実装構成

### 必要ライブラリ（Rust）

- `aes-gcm` or `aes` crate
- `sha2`（SHA-512）
- `hmac`（署名）
- `rand`（ランダマイザ選択）

---

## 暗号化フェーズ：Encrypt

```rust
use aes::Aes256;
use sha2::{Sha512, Digest};
use hmac::{Hmac, Mac};
use rand::Rng;

type HmacSha512 = Hmac<Sha512>;

fn encrypt_data(data: &[u8], key: &[u8]) -> Vec<u8> {
    // 任意の簡易AES暗号処理（省略）
    data.to_vec()
}

fn sign(data: &[u8], key: &[u8]) -> Vec<u8> {
    let mut mac = HmacSha512::new_from_slice(key).expect("HMAC init failed");
    mac.update(data);
    mac.finalize().into_bytes().to_vec()
}

fn generate_key() -> Vec<u8> {
    let mut key = [0u8; 32];
    rand::thread_rng().fill(&mut key);
    key.to_vec()
}

fn derive_rid(key: &[u8]) -> u8 {
    key[0] % 256
}
```

---

## 復号フェーズ：Decrypt

```rust
fn decrypt_data(encrypted: &[u8], key: &[u8]) -> Vec<u8> {
    // 任意の簡易AES復号処理（省略）
    encrypted.to_vec()
}

fn apply_randomizer(data: &[u8], rid: u8) -> Vec<u8> {
    // 256種のランダマイザ切替呼び出し
    data.to_vec() // 例：単なるバイパス（ダミー含む）
}
```

---

## 出力例：

- 暗号化：`(暗号データ, ランダマイザ選択値 RID)`
- 復号出力：`(整合性ある出力データ, 鍵に基づくシグネチャ)`

**→ これを“真”と判断できるのは、`真のシグネチャ`を保有している者だけ。**

---

## シグネチャ照合の仕組み

```rust
fn verify_signature(signature: &[u8], expected: &[u8]) -> bool {
    signature == expected
}
```

- 照合失敗でも「エラーを返さない」。一致する場合のみ、利用者が「気づく」。

---

## ランダマイザの構造

- 256種のランダマイザを静的に定義（実質16系統×16サブタイプ）
- 各ランダマイザは、復号後のデータに軽微な加工を行うか、またはそのまま返す（ダミー）
- 選択は鍵の導出値で一意に決定されるため、外部からの判別は不可能

---

## まとめ：ISEの本質的優位性

| 項目 | 説明 |
|------|------|
| **否認可能性** | 「自分が真の鍵である」ことの証明が出来ない。他者からも検証不能。 |
| **シンプルな構造** | 真の鍵・真のシグネチャ・ランダマイザ選択値 ＝最小構成 |
| **攻撃耐性** | Oracle不可、復号は常に整合性ある結果を出す |
| **高速実装** | AES256 + SHA512のみ。追加演算少なく、モバイル実装可能 |
| **汎用性** | 暗号ライブラリ標準実装で全構成対応可能 |

---

## 備考：対象外とする領域

- ISEでは**ZIPやRARなどの既存ファイル圧縮・整形処理**は対象外
- ISEはあくまで**情報の真偽の保証と否認構造の構築**に特化

---

## 提案フェーズ

このドキュメントはISE設計思想と実装サンプルを統合した草案として、DeepResearch等の評価機関への提示を前提とした初期設計書である。