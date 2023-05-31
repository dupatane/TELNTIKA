#!/bin/bash
#set -x
log_file="/home/ubuntu/TELNTIKA/montoring/auth.log"
pattern="error"  # The pattern to detect in the log file
email_recipient="dupatanekrishna@gmail.com"  # Email recipient

tail "$log_file" | while read line
do
    if echo "$line" | grep -q "$pattern"; then
        echo " working"
        echo "Invalid user in log file: $line" | mail -s "Invalid user" "$email_recipient"
    fi
done
