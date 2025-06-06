fragment_map:
  version: 0.1
  post_id: "123e4567-e89b-12d3-a456-426614174000"
  vov_id: "VoV-4A7F-882C"
  nickname: "nullpointer"
  timestamp: "2025-06-07T04:15:00Z"
  signature:
    type: "PGP"
    hash: "ABCD1234...ZXY999"
  intent_flags:
    - "no-AI-training"
    - "non-commercial-use-only"

  text_fragments:
    redundancy: 3
    fragments:
      - id: "frag-01"
        hash: "sha256:e3b0c442..."
        size: 512
        seq: 1
      - id: "frag-02"
        hash: "sha256:fc9b2d90..."
        size: 512
        seq: 2

  image_pointers:
    - original_name: "sunset.jpg"
      hash: "sha256:fae0923d..."
      mime_type: "image/jpeg"
      index: 0
    - original_name: "avatar.png"
      hash: "sha256:9823abcd..."
      mime_type: "image/png"
      index: 1

  video_pointers:
    - original_name: "intro.mp4"
      hash: "sha256:3d8e5f2a..."
      mime_type: "video/mp4"
      index: 0

  attachments:
    - original_name: "manifest.pdf"
      hash: "sha256:beadfeed..."
      mime_type: "application/pdf"
      index: 0

  integrity:
    total_fragments: 2
    expected_redundancy: 3
    verification_required: true
    hash_algorithm: "SHA-256"

  swarm_targets:
    - peer_id: "node-FF09"
      status: "acknowledged"
    - peer_id: "node-6C3E"
      status: "pending"
    - peer_id: "node-D42B"
      status: "replicating"
