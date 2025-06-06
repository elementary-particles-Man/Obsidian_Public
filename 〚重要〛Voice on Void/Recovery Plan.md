recovery_plan:
  version: 0.1
  node_id: "node-hinode"
  user_id: "VoV-FF22-A1B3"
  last_updated: "2025-06-07T05:40:00Z"

  triggers:
    - event: "fragment_missing"
      description: "要求された断片がストレージに存在しない"
      action: "request_from_peers"

    - event: "fragment_corrupted"
      description: "ハッシュ検証に失敗した断片の検出"
      action: "discard_and_request_redundant"

    - event: "node_shutdown"
      description: "ノードの不正終了や予期しないオフライン化"
      action: "requeue_fragments_after_restart"

    - event: "redundancy_violation"
      description: "冗長性閾値を下回った断片グループの検出"
      action: "broadcast_reconstruction_request"

  peer_policy:
    min_peer_count: 5
    max_retry_per_fragment: 3
    response_timeout_seconds: 10
    trust_score_min: 0.7

  fallback:
    - method: "backup_archive"
      description: "2時間ごとに自動生成されるローカルバックアップから再取得"
      path: "/var/vov/backup/archive_latest.tar.gz"

    - method: "admin_manual_inject"
      description: "ネットワーク外部から断片を管理者が手動復元"
      contact: "admin@vovnet.org"

  notification:
    on_failure: true
    method: "log_and_popup"
    log_path: "/var/log/vov/recovery.log"
