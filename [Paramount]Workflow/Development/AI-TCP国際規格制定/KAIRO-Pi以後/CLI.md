 4. RFCドキュメントの更新提案


  docs/RFC/AI-TCP.md は既にRust実装を本線とすることを追記済みです。

  5. 新しいドキュメント構造の提示


  整理後のドキュメント構造は以下のようになります。



    1 D:/Dev/AI-TCP/
    2 ├───docs/
    3 │   ├───RFC/
    4 │   │   └───AI-TCP.md (旧 docs/AI-TCP_RFC.md)
    5 │   ├───SPEC/
    6 │   │   └───AI-TCP_Security.md (もし存在すれば)
    7 │   ├───AI-TCP_ImplementationPlan.md
    8 │   ├───AI-TCP_SessionModel.md
    9 │   └───AI-TCP_WireFormat.md
   10 │   └───AI-TCP_CLI_Spec..md (内容が空)
   11 ├───legacy/
   12 │   ├───docs/
   13 │   │   └───AI-TCP_CLI_Spec..md (旧 docs/AI-TCP_CLI_Spec..md の内容)
   14 │   ├───flatbuffers/
   15 │   │   ├───ai_tcp_packet_generated.fbs (旧 flatbuffers/ai_tcp_packet_generated.fbs の内容)
   16 │   │   └───ephemeral_session.fbs (旧 flatbuffers/ephemeral_session.fbs の内容)
   17 │   ├───go/ (旧 go/ ディレクトリ)
   18 │   ├───python/ (旧 python/ ディレクトリ)
   19 │   └───README.md
   20 └───KAIRO/
   21     └───schema/
   22         ├───ai_tcp_packet.fbs (AI-TCPパケットの真の定義)
   23         └───ephemeral_session.fbs (エフェメラルセッションの真の定義)


  FlatBuffersスキーマとの整合性確認:


   * 現行仕様: KAIRO/schema/ai_tcp_packet.fbs と KAIRO/schema/ephemeral_session.fbs
     がAI-TCPプロトコルの真のFlatBuffersスキーマとして扱われます。これらはRust実装の ai_tcp_packet_generated.rs と
     ephemeral_session_generated.rs の生成元となります。
   * レガシーFlatBuffers: legacy/flatbuffers/ai_tcp_packet_generated.fbs と legacy/flatbuffers/ephemeral_session.fbs
     は、現行仕様と異なるため、legacy ディレクトリに隔離されました。これらは、過去のプロトコル定義や特定の目的のため
     に使用された可能性のある、もはや本線ではないスキーマとして扱われます。


  これで、ドキュメント構造の整理とレガシー資源の再構成が完了しました。
