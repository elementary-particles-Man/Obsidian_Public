<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>VoV 投稿処理フロー設計図</title>
  <style>
    body {
      font-family: "Hiragino Kaku Gothic ProN", Meiryo, sans-serif;
      background-color: #f9f9f9;
      color: #333;
      margin: 2em;
    }
    h1 {
      border-bottom: 2px solid #4caf50;
      padding-bottom: 0.3em;
    }
    section {
      margin-top: 2em;
    }
    .uml-image {
      max-width: 100%;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .uml-link {
      font-size: 0.9em;
      color: #0074d9;
    }
    pre {
      background-color: #f0f0f0;
      padding: 1em;
      border-radius: 4px;
      overflow-x: auto;
    }
  </style>
</head>
<body>
  <h1>VoV 投稿処理プロセス設計図（日本語）</h1>

  <section>
    <h2>📌 処理フロー概要</h2>
    <p>この図は、VoVにおける「投稿 → 署名 → 断片化 → 拡散 → ローカル削除」の一連の処理を示しています。</p>
  </section>

  <section>
    <h2>🖼️ PlantUML図</h2>
    <p>
      <a class="uml-link" href="https://www.plantuml.com/plantuml/png/JP91QnD17CNlyodcc1n4q5iNiP1A2NXO17iFPek1TYDsU_2McOb9DcviA2IjLgdHa4R39c91MvDsFypRsMrE_GhEx83DPHd-y_Qz__ljhkzvfTVU_kuEyIhUZaEtgbiqQVVISIIRexJRW3Y22C7du9VovFnsqKglVibk1sAUzCFKRygWhy_l1adls-t29oGp96GDOWIn0F-jdommfl7LfwJLfRd2qoBODTWfs6ppUJ5laJMLR5VtFF0V47tm2_0py1b42smYXtvoS69fqp0pdK1Cz7mQoBVZEFeimsEBaCespPdrRiQXd7u4u-3jntdglNHScbDPOFKyeLI7tIjkW9tPc_Rz9uM2USlILwW5QNsWoibmb4Q7wOWbuLVKEcdeWqsJ-e6C598Un7Vmd-27yVnOjhzOn77BbMsIzTWeERjLLvN-ZyZ0L6evFRqP1Ag9kTAJnj6ozqTf5DjdJddVBPVS5s_e8_fGuRmJiWdu4E8SeWaXD1b-2JOsHSmQySLxYwmusmziY8vMAuXYbe6RAQDbZSNHG5cRWu8O_st8wm0rjihNmDLvUX99lxtyCBJq1ww-8kkghlvh_W40" target="_blank">
        👉 クリックして図を拡大表示（別タブ）
      </a>
    </p>
    <img class="uml-image" src="https://www.plantuml.com/plantuml/png/JP91QnD17CNlyodcc1n4q5iNiP1A2NXO17iFPek1TYDsU_2McOb9DcviA2IjLgdHa4R39c91MvDsFypRsMrE_GhEx83DPHd-y_Qz__ljhkzvfTVU_kuEyIhUZaEtgbiqQVVISIIRexJRW3Y22C7du9VovFnsqKglVibk1sAUzCFKRygWhy_l1adls-t29oGp96GDOWIn0F-jdommfl7LfwJLfRd2qoBODTWfs6ppUJ5laJMLR5VtFF0V47tm2_0py1b42smYXtvoS69fqp0pdK1Cz7mQoBVZEFeimsEBaCespPdrRiQXd7u4u-3jntdglNHScbDPOFKyeLI7tIjkW9tPc_Rz9uM2USlILwW5QNsWoibmb4Q7wOWbuLVKEcdeWqsJ-e6C598Un7Vmd-27yVnOjhzOn77BbMsIzTWeERjLLvN-ZyZ0L6evFRqP1Ag9kTAJnj6ozqTf5DjdJddVBPVS5s_e8_fGuRmJiWdu4E8SeWaXD1b-2JOsHSmQySLxYwmusmziY8vMAuXYbe6RAQDbZSNHG5cRWu8O_st8wm0rjihNmDLvUX99lxtyCBJq1ww-8kkghlvh_W40" alt="VoV投稿処理フロー" />
  </section>

  <section>
    <h2>🧩 処理ステップの説明</h2>
    <ol>
      <li>ユーザーが投稿作成（CLIまたはGUI）</li>
      <li>VoVPostオブジェクトとしてローカル保存</li>
      <li>VoV-IDによる署名と意志表明タグ付加</li>
      <li>VoVDaemonが投稿を断片化・冗長化</li>
      <li>各断片にインデックスとIDを付与してP2Pネットワークへ拡散</li>
      <li>拡散完了後、ローカルの完全投稿データを破棄</li>
    </ol>
  </section>
</body>
</html>
