#!/bin/bash

LOG=/var/log/nginx/access.log

if [ ! -f $LOG ]; then
 echo "Файл отсутствует"
 exit
fi

TOTAL=$(wc -l < $LOG)
SUCCESS=$(grep -c " 200 " $LOG)
ERRORS=$(grep -c " 4[0-9][0-9] " $LOG)

echo "Всего запросов: $TOTAL"
echo "Успешных (200): $SUCCESS"
echo "Ошибок (4хх): $ERRORS"

echo ""
echo "Топ IP адресов"
awk '{print $1}' $LOG | sort | uniq -c | sort -rn | head -3
