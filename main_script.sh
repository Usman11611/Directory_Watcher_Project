#!/bin/bash

# Source the logging script
if [[ -f ./json_logger.sh ]]; then
  source ./json_logger.sh
else
  echo "Error: Logging script 'json_logger.sh' not found!" >&2
  exit 1
fi

# Check if an argument was provided
if [[ -z "$1" ]]; then
  echo "Usage: $0 <folder_to_monitor>"
  exit 1
fi

# Use the first argument as the folder to monitor
monitor_dir="$1"

# Create the folder if it doesn't exist
if [[ ! -d "$monitor_dir" ]]; then
  echo "Folder '$monitor_dir' does not exist. Creating it..."
  mkdir -p "$monitor_dir"
  echo "Folder '$monitor_dir' has been created."
fi

# Ensure inotifywait is installed
if ! command -v inotifywait &>/dev/null; then
  echo "Error: inotify-tools is not installed. Install it to use this script." >&2
  exit 1
fi

# Get user ID and IP address
user_id=$(id -u)
ip_address=$(hostname -I | awk '{print $1}')

echo "Monitoring directory: $monitor_dir"
echo "User ID: $user_id"
echo "IP Address: $ip_address"
echo "Press [CTRL+C] to stop monitoring."

# Monitor file events in the directory
inotifywait -m -e create -e delete -e modify -e move "$monitor_dir" --format '%e %w%f' |
while read -r event file; do
  case $event in
    CREATE*)
      log_json "INFO" "file_monitor" "File created: $file" "$user_id" "$ip_address"
      echo "Logged: File created -> $file"
      ;;
    DELETE*)
      log_json "WARNING" "file_monitor" "File deleted: $file" "$user_id" "$ip_address"
      echo "Logged: File deleted -> $file"
      ;;
    MODIFY*)
      log_json "INFO" "file_monitor" "File modified: $file" "$user_id" "$ip_address"
      echo "Logged: File modified -> $file"
      ;;
    MOVED_FROM*)
      log_json "INFO" "file_monitor" "File moved from: $file" "$user_id" "$ip_address"
      echo "Logged: File moved from -> $file"
      ;;
    MOVED_TO*)
      log_json "INFO" "file_monitor" "File moved to: $file" "$user_id" "$ip_address"
      echo "Logged: File moved to -> $file"
      ;;
    *)
      log_json "INFO" "file_monitor" "Other event ($event) on $file" "$user_id" "$ip_address"
      echo "Logged: Other event ($event) -> $file"
      ;;
  esac
done
