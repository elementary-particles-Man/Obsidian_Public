vov_storage_map:
  version: 0.1
  user_id: "VoV-FF22-A1B3"
  node_name: "node-hinode"
  allocation:
    mode: "single_file"  # "single_file" または "directory"
    path: "/var/vov/vovswap.bin"
    size_bytes: 10737418240  # 10GB
    reserved_percent: 15  # 常時空き容量として残す分（例：15%）

  block_config:
    block_size_bytes: 4096
    redundancy: 3
    compression: "lz4"
    encryption: "aes-256-gcm"

  current_map:
    total_blocks: 2621440
    used_blocks: 482120
    free_blocks: 2139320
    damaged_blocks: 0
    last_check: "2025-06-07T05:20:00Z"

  fragment_index:
    - frag_id: "frag-01"
      hash: "sha256:e3b0c442..."
      stored_at_offset: 0
      size: 512
      status: "valid"
    - frag_id: "frag-02"
      hash: "sha256:fc9b2d90..."
      stored_at_offset: 4096
      size: 512
      status: "valid"

  monitoring:
    daemon_pid: 4321
    status: "active"
    last_activity: "2025-06-07T05:18:47Z"
    error_count: 0
    recovery_action: "none"

  policy:
    eviction: "LRU"
    backup_interval_minutes: 120
    max_fragment_age_days: 30
