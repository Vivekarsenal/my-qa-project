#!/bin/bash


SOURCE_DIR="/path/to/source"          # Change this to your source directory
BACKUP_DIR="/path/to/backup"          # Change this to your backup directory
REMOTE_USER="username"                 # Change this to your remote username
REMOTE_HOST="remote.server.com"        # Change this to your remote server
DATE=$(date +'%Y-%m-%d_%H-%M-%S')


mkdir -p "$BACKUP_DIR"


rsync -av --delete "$SOURCE_DIR" "$REMOTE_USER@$REMOTE_HOST:$BACKUP_DIR/backup_$DATE"

# Check the exit status of the rsync command
if [ $? -eq 0 ]; then
    echo "Backup successful: $SOURCE_DIR backed up to $REMOTE_USER@$REMOTE_HOST:$BACKUP_DIR/backup_$DATE"
else
    echo "Backup failed."
fi
