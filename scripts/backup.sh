#!/bin/bash
DATE=$(date +%F)
BACKUP_DIR=~/backups
SOURCE=~/devops-monitoring-stack

mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/backup-$DATE.tar.gz $SOURCE 2>/dev/null
find $BACKUP_DIR -name "*.tar.gz" -mtime +7 -delete
echo "$(date) OK: бэкап создан backup-$DATE.tar.gz" >> ~/backup.log
