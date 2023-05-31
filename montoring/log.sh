#!/bin/bash

log_file="/var/log/auth.log"
pattern="Invalid user"  # The pattern to detect in the log file
email_recipient="dupatanekrishna@gmail.com"  # Email recipient

tail "$log_file" | while read line
do
    if echo "$line" | grep -q "$pattern"; then
        echo " working"
        echo "Invalid user in log file: $line" | mail -s "Invalid user" "$email_recipient"
    fi
done
