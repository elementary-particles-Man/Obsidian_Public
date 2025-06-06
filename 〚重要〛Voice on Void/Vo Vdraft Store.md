vov_draft_store:
  version: 0.1
  user_id: "VoV-FF22-A1B3"
  last_updated: "2025-06-07T06:52:00Z"

  drafts:
    - draft_id: "dft-001"
      type: "post"
      timestamp: "2025-06-07T06:30:15Z"
      title: "新機能告知投稿"
      content: "VoVシステムの正式公開準備が整いました。"
      attachments:
        - "announce.png"
      intent_flags:
        - "no-AI-training"
        - "non-commercial"
      tags:
        - "#VoV"
        - "#告知"
      group_id: "grp-202506"
      is_signed: false

    - draft_id: "dft-002"
      type: "reply"
      timestamp: "2025-06-07T06:40:00Z"
      parent_post_id: "f7d9a8ac-d23b-44f4-9a12-991133abc000"
      content: "未来SNS構築、全力で応援します！"
      attachments: []
      intent_flags:
        - "public"
      tags: []
      is_signed: false

  metadata:
    total_drafts: 2
    save_directory: "~/.vov/drafts"
    auto_cleanup_days: 30
