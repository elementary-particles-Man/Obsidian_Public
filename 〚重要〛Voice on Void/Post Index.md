post_index:
  version: 0.1
  node_id: "node-hinode"
  last_updated: "2025-06-07T06:30:00Z"

  posts:
    - post_id: "123e4567-e89b-12d3-a456-426614174000"
      timestamp: "2025-06-07T05:42:00Z"
      vov_id: "VoV-4A7F-882C"
      nickname: "alice"
      content_digest: "これはVoVの投稿テストです。世界に..."
      has_attachments: true
      intent_flags:
        - "no-AI-training"
        - "non-commercial"
      tags:
        - "#VoV"
        - "#テスト"
      group_id: "grp-202506"
      parent_post_id: null

    - post_id: "f7d9a8ac-d23b-44f4-9a12-991133abc000"
      timestamp: "2025-06-07T04:20:00Z"
      vov_id: "VoV-2C1B-347F"
      nickname: "bob"
      content_digest: "VoVで未来のSNSを作るぞ。"
      has_attachments: false
      intent_flags:
        - "public"
      tags:
        - "#VoV"
        - "#未来"
      group_id: "grp-202506"
      parent_post_id: null

  metadata:
    total_count: 2
    groups:
      - id: "grp-202506"
        name: "2025年6月投稿群"
        created: "2025-06-01T00:00:00Z"
