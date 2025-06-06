<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>VoV 投稿インターフェース</title>
  <style>
    body {
      font-family: "Meiryo", sans-serif;
      background-color: #f4f6f8;
      color: #333;
      margin: 0;
      padding: 2rem;
    }
    .container {
      max-width: 900px;
      margin: auto;
      background: #fff;
      padding: 2rem;
      border-radius: 12px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
    textarea, input[type="file"], select {
      width: 100%;
      margin-top: 0.5rem;
      margin-bottom: 1rem;
      padding: 0.75rem;
      border-radius: 6px;
      border: 1px solid #ccc;
      font-size: 1rem;
    }
    label {
      font-weight: bold;
      margin-top: 1rem;
      display: block;
    }
    button {
      background-color: #2196f3;
      color: white;
      border: none;
      padding: 0.75rem 1.5rem;
      font-size: 1rem;
      border-radius: 6px;
      cursor: pointer;
    }
    button:hover {
      background-color: #1976d2;
    }
    .output {
      margin-top: 2rem;
      white-space: pre-wrap;
      background: #eef3f7;
      padding: 1rem;
      border-radius: 6px;
      font-family: monospace;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>VoV 投稿画面</h1>
    <label for="text">投稿内容</label>
    <textarea id="text" rows="6" placeholder="ここに投稿内容を記入してください..."></textarea>

    <label for="file">添付ファイル</label>
    <input type="file" id="file" multiple>

    <label for="policy">投稿ポリシー</label>
    <select id="policy">
      <option value="public">公開（全体拡散）</option>
      <option value="friends">限定（信頼ピアのみ）</option>
      <option value="private">非公開（保管のみ）</option>
    </select>

    <label>
      <input type="checkbox" id="sign"> 署名を付与（PGP）
    </label>
    <label>
      <input type="checkbox" id="noai"> AI学習を許可しない
    </label>

    <button onclick="submitPost()">投稿を生成する</button>

    <div class="output" id="output"></div>
  </div>

  <script>
    function submitPost() {
      const text = document.getElementById('text').value;
      const file = document.getElementById('file').files;
      const policy = document.getElementById('policy').value;
      const sign = document.getElementById('sign').checked;
      const noai = document.getElementById('noai').checked;

      const summary = `📝 投稿概要\n-----------------------------\n` +
        `📄 本文: ${text.substring(0, 80)}...\n` +
        `📎 添付ファイル数: ${file.length}\n` +
        `🔒 ポリシー: ${policy}\n` +
        `✍️ 署名付与: ${sign}\n` +
        `🤖 AI学習禁止: ${noai}`;

      document.getElementById('output').textContent = summary + '\n\n📦 CUIにデータを転送します...';

      // TODO: このデータをCUI（VoVDaemonなど）に渡す処理をGoで設計
    }
  </script>
</body>
</html>
