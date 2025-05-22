#!/bin/bash

echo "=========================================="
echo "         SERVER PERFORMANCE STATS         "
echo "=========================================="
echo

# CPU USAGE
echo "[Total CPU Usage]"
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}')
echo "CPU Usage: $CPU_USAGE"
echo

# MEMORY USAGE
echo "[Memory Usage]"
MEM_TOTAL=$(free -m | awk '/^Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/^Mem:/ {print $3}')
MEM_FREE=$(free -m | awk '/^Mem:/ {print $4}')
MEM_USAGE_PERCENT=$(awk "BEGIN {printf \"%.2f\", ($MEM_USED/$MEM_TOTAL)*100}")

echo "Total Memory : ${MEM_TOTAL} MB"
echo "Used Memory  : ${MEM_USED} MB"
echo "Free Memory  : ${MEM_FREE} MB"
echo "Usage        : ${MEM_USAGE_PERCENT}%"
echo

# DISK USAGE
echo "[Disk Usage]"
DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')
DISK_USAGE_PERCENT=$(df -h / | awk 'NR==2 {print $5}')

echo "Total Disk : $DISK_TOTAL"
echo "Used Disk  : $DISK_USED"
echo "Free Disk  : $DISK_FREE"
echo "Usage      : $DISK_USAGE_PERCENT"
echo

# TOP 5 PROCESSES BY CPU USAGE
echo "[Top 5 Processes by CPU Usage]"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo

# TOP 5 PROCESSES BY MEMORY USAGE
echo "[Top 5 Processes by Memory Usage]"
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6
echo

echo "=========================================="
