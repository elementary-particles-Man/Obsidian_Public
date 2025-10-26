# 指示書: KAIRO自己統治型調整ノードの実装 (CODEX向け)

### 1. 目的 (Objective)

KAIROプロジェクト内に、軽量かつ`Headscale`互換の自己統治型「調整ノード（Coordination Node）」を実装する。これにより、AI-TCPネットワークは外部の認証・管理サービスへの依存を完全に排除し、ノード登録、鍵交換、仮想IPアドレス割り当てを自律的に行う基盤を確立する。

### 2. 設計思想 (Design Philosophy)

- **責務の分離:** 本モジュールは、KAIROのセキュリティカーネルの一部として機能する。責務はノード管理と認証に限定され、AI-TCPの高レベルなプロトコル解釈は行わない。
    
- **自己統治:** 外部の認証局（CA）や管理コンソールを必要とせず、KAIROネットワークに参加するノード同士が、この調整ノードを介して相互に信頼を確立する。
    
- **監査可能性:** ノード登録やIP割り当てといった全ての状態変更イベントは、必ずVoV（Voice of Verification）ログに記録され、改竄不可能な証跡として残される。
    

### 3. 実装タスク (Implementation Tasks)

**言語:** Rust

#### タスク1: ディレクトリ構造とモジュールの作成

- `KAIRO/rust-core/src/` 配下に `coordination` ディレクトリを新規作成する。
    
- 以下のファイルを作成し、モジュールとして`lib.rs`に登録する。
    
    - `coordination/mod.rs`
        
    - `coordination/node_manager.rs`
        
    - `coordination/api.rs`
        

#### タスク2: 依存関係の追加

- `KAIRO/rust-core/Cargo.toml` に、調整ノードのAPIサーバー機能を実現するため、以下のWebフレームワークの依存関係を追加する。
    
    - `warp = "0.3"`
        
    - `tokio = { version = "1", features = ["full"] }`
        
    - `serde = { version = "1.0", features = ["derive"] }`
        

#### タスク3: ノード管理ロジックの実装 (`node_manager.rs`)

- `Node` 構造体を定義する。
    
    - メンバ: `id` (String: 128-bit Unique ID), `public_key` (Vec), `virtual_ip` (String)
        
- `NodeManager` 構造体を定義する。
    
    - メンバ: `nodes` (HashMap<String, Node>)
        
    - **重要:** 複数ノードからの同時アクセスを想定し、`nodes`は`Arc<Mutex<...>>`でラップし、スレッドセーフな設計とすること。
        
- `NodeManager`に`new()`関数と、以下の機能を持つメソッドのスタブ（TODOコメント付き）を実装する。
    
    - `register_node(...)`: 新規ノードを公開鍵と共に登録し、仮想IPを割り当てる。
        
    - `get_peers(...)`: 認証済みノードに、他のピアのリスト（公開鍵、仮想IP）を返す。
        

#### タスク4: APIエンドポイントの実装 (`api.rs`)

- `warp`フレームワークを使用し、以下のAPIエンドポイントのスタブを実装する。
    
- **`POST /register`**:
    
    - 新規ノードが自身の公開鍵を含むJSONボディを送信する。
        
    - リクエストを受け取り、`NodeManager`の`register_node`を呼び出す（TODO）。
        
    - 成功レスポンスとして、割り当てられた仮想IPを含むJSONを返す。
        
    - **重要:** 登録イベントは必ずVoVログに記録するロジックを呼び出す（TODO）。
        
- **`GET /peers`**:
    
    - 認証済みノードからのリクエストを受け付ける。
        
    - `NodeManager`の`get_peers`を呼び出し、ピアのリストを取得する（TODO）。
        
    - ピアのリストをJSON形式で返す。
        

#### タスク5: モジュールの統合 (`lib.rs`)

- `rust-core/src/lib.rs`に`pub mod coordination;`を追記し、作成したモジュールをライブラリ全体に公開する。
    

### 4. 期待される成果物

- コンパイル可能な`KAIRO/rust-core`ライブラリのスケルトン。
    
- `warp`で定義された`/register`と`/peers`のAPIエンドポイントのスタブ。
    
- `NodeManager`の基本的な構造と、将来実装すべきロジックを示すTODOコメント。