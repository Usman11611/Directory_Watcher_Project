Directory Watcher Project
Developed by: Usman Haider
GitHub Repository: Usman11611/Directory_Watcher_Project

Overview
The Directory Watcher Project is a Bash-based tool designed to monitor changes in a specified directory and log events in real-time to a JSON file. The script leverages the inotifywait utility to track events such as file creation, modification, deletion, and renaming. It is ideal for system administrators, developers, and students interested in system programming and event logging.

The project focuses on flexibility, real-time feedback, and structured logging, making it suitable for use cases like filesystem monitoring, auditing, and debugging.

Key Features
Real-Time Monitoring

Tracks file and directory events like creation, modification, deletion, and renaming.
Monitors nested subdirectories for comprehensive tracking.
JSON Logging

Logs events in a structured JSON format, including timestamps, event types, file paths, and customizable metadata like user IDs and IP addresses.
Error Handling

Handles invalid directories and permissions gracefully, ensuring smooth operation.
Configurable Logging

Users can customize the log file name, location, and additional metadata.
Lightweight and Efficient

Built entirely in Bash, requiring minimal dependencies and resources.
Technology Stack
Language: Bash scripting
Tool: inotify-tools (Linux filesystem monitoring)
Output Format: JSON
Setup Instructions
Prerequisites
Install Git (if not already installed):


sudo apt-get update  
sudo apt-get install git  
Install inotify-tools:


sudo apt-get install inotify-tools  
Installation Steps
Clone the Repository:


git clone https://github.com/Usman11611/Directory_Watcher_Project.git  
cd Directory_Watcher_Project  
Make the Script Executable:


chmod +x directory_watcher.sh  
Run the Script:


./directory_watcher.sh /path/to/directory  
Replace /path/to/directory with the folder you want to monitor.

Log Format
Logs are saved in the logs.json file in the following format:


{
  "timestamp": "2024-11-26T14:00:01Z",
  "log_level": "INFO",
  "source": "/path/to/directory/example_file.txt",
  "message": "CREATE occurred",
  "details": {
    "user_id": "1234",
    "ip_address": "192.168.1.1"
  }
}

Conclusion:

The Directory Watcher Project is a powerful, lightweight tool designed to streamline filesystem monitoring and event logging. With its real-time tracking capabilities and structured JSON logs, this project simplifies the process of auditing directory changes for both developers and administrators.

For further details, contributions, or issues, please visit the GitHub Repository.

Creator
Usman Haider – Developer and Designer
