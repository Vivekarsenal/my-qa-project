#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

# Log file
LOGFILE="/var/log/system_health.log"

# Function to log messages
log_message() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOGFILE"
}

# Check CPU usage
CPU_USAGE=$(mpstat 1 1 | grep "all" | awk '{print 100 - $12}')
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
    log_message "ALERT: CPU usage is above ${CPU_THRESHOLD}%: ${CPU_USAGE}%"
fi

# Check memory usage
MEMORY_USAGE=$(free | awk '/Mem/{printf "%.2f", $3/$2 * 100.0}')
if (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) )); then
    log_message "ALERT: Memory usage is above ${MEMORY_THRESHOLD}%: ${MEMORY_USAGE}%"
fi

# Check disk space usage
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    log_message "ALERT: Disk space usage is above ${DISK_THRESHOLD}%: ${DISK_USAGE}%"
fi

# Check running processes
PROCESS_COUNT=$(ps aux | wc -l)
if [ "$PROCESS_COUNT" -gt 200 ]; then
    log_message "ALERT: Number of running processes is above 200: ${PROCESS_COUNT}"
fi

