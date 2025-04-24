#!/bin/bash

echo "Checking Server Health..."

# CPU Usage
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "Used: " $2 ", Idle: " $8}'

# Memory Usage
echo "Memory Usage:"
free -h | awk 'NR==2{print "Used: " $3 ", Free: " $4}'

# Disk Usage
echo "Disk Usage:"
df -h --output=source,pcent | grep '^/dev/'

echo "[ Health Check Completed! ]"

