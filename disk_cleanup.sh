#!/bin/bash

# Slackware Disk Cleanup Script

# Define directories to clean
TEMP_DIRS=("/tmp" "/var/tmp")
LOG_DIRS=("/var/log")

# Define file extensions to remove
TEMP_EXTENSIONS=("*.bak" "*.swp" "*.log" "*.old" "*.gz" "*.1" "*.2" "*.3")

# Function to remove temporary files
clean_temp_files() {
    for dir in "${TEMP_DIRS[@]}"; do
        for ext in "${TEMP_EXTENSIONS[@]}"; do
            find "$dir" -type f -name "$ext" -exec rm -f {} \;
        done
    done
}

# Function to remove old log files
clean_old_logs() {
    for dir in "${LOG_DIRS[@]}"; do
        find "$dir" -type f -name "*.log.*" -exec rm -f {} \;
    done
}

# Main function
main() {
    echo "Starting disk cleanup..."

    # Remove temporary files
    clean_temp_files

    # Remove old log files
    clean_old_logs

    echo "Disk cleanup completed."
}

# Run the main function
main
