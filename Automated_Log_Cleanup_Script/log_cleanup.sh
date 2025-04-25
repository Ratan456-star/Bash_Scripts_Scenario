#!/bin/bash

LOG_DIR="/var/log"    
DAYS_TO_KEEP=7        

echo "Deleting logs older than $DAYS_TO_KEEP days in $LOG_DIR ..."

find $LOG_DIR -type f -name "*.log" -mtime +$DAYS_TO_KEEP -exec rm -f {} \;

echo "Log Cleanup Completed!"

