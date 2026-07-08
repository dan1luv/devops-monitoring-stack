#!/bin/bash

LOG=$1

if [ -z "$LOG" ]; then
 echo "Использование: $0 <файл.log>"
    exit 1
fi

echo "=== Запуск: $(date) ==="
echo "=== Анализ лога: $LOG ==="
echo ""
echo "Всего строк: $(wc -l < $LOG)"
echo "ERROR:       $(grep -c 'ERROR' $LOG)"
echo "WARN:        $(grep -c 'WARN' $LOG)"
echo "INFO:        $(grep -c 'INFO' $LOG)"
echo ""
echo "=== Последние ошибки ==="
grep "ERROR" $LOG | tail -3
echo ""
echo "=== Топ IP адресов ==="
awk '/New connection/ {print $7}' $LOG | sort | uniq -c | sort -rn
