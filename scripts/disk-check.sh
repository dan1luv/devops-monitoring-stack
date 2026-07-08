#!/bin/bash
USAGE=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

if [ $USAGE -gt 80 ]; then
 echo "$(date) WARN: диск заполнен на $USAGE%" >> ~/disk-alert.log
else
 echo "$(date) OK: дмск заполнен на $USAGE%" >> ~/disk-alert.log
fi
