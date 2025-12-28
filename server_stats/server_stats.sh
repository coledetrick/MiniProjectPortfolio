#!/usr/bin/env bash

# Run 'top' once in batch mode, extract idle CPU. subtract 100 to get total CPU.

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
echo "Total CPU Usage: ${CPU_USAGE}%"
echo

# Use 'free -m' to get memory in MB
# Total = all memory
# Used  = memory currently in use
# Free  = unused memory
MEM_TOTAL=$(free -m | awk 'NR==2{print $2}')
MEM_USED=$(free -m | awk 'NR==2{print $3}')
MEM_FREE=$(free -m | awk 'NR==2{print $4}')

# Calculate memory usage percentage
MEM_USED_PCT=$((MEM_USED * 100 / MEM_TOTAL))

echo "Memory Usage:"
echo "  Used: ${MEM_USED}MB (${MEM_USED_PCT}%)"
echo "  Free: ${MEM_FREE}MB"
echo

# Check disk usage for root filesystem.
# df -h returns dusk free in human readable.
DISK_USED=$(df -h / | awk 'NR==2{print $3}')
DISK_FREE=$(df -h / | awk 'NR==2{print $4}')
DISK_USED_PCT=$(df -h / | awk 'NR==2{print $5}')

echo "Disk Usage (/):"
echo "  Used: ${DISK_USED} (${DISK_USED_PCT})"
echo "  Free: ${DISK_FREE}"
echo

# List processes sorted by CPU usage 
# Show only the top 5 
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo

# List processes sorted by memory usage 
# Show only the top 5 
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
