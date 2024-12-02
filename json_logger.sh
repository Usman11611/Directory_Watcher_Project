#!/bin/bash

log_file="logs.json"

log_json() {
  local log_level="$1"
  local source="$2"
  local message="$3"
  local user_id="$4"
  local ip_address="$5"

  # Check if log level, source, and message are provided
  if [[ -z "$log_level" || -z "$source" || -z "$message" ]]; then
    echo "Error: Missing required parameters (log_level, source, message)." >&2
    return 1
  fi

  # Check if log file is writable
  if [[ ! -w "$log_file" && -f "$log_file" ]]; then
    echo "Error: Log file is not writable: $log_file" >&2
    return 1
  fi

  # Create log entry
  log_entry=$(cat <<EOF
{
  "timestamp": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "log_level": "$log_level",
  "source": "$source",
  "message": "$message",
  "details": {
    "user_id": "$user_id",
    "ip_address": "$ip_address"
  }
}
EOF
)

  # Write to log file
  echo "$log_entry," >> "$log_file" || {
    echo "Error: Failed to write to log file: $log_file" >&2
    return 1
  }

  return 0
}

