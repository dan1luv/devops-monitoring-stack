#!/bin/bash
echo "=== Отчёт о сервере ==="
echo "Дата: $(date)"
echo ""
echo "--- Uptime ---"
uptime
echo ""
echo "--- Память ---"
free -h
echo ""
echo "--- Диск ---"
df -h | grep -v tmpfs

echo "--- Сервисы ---"
for service in nginx docker cron ssh; do
    if systemctl is-active --quiet $service; then
        echo "✓ $service"
    else
        echo "✗ $service"
    fi
done

echo ""
echo "--- Открытые порты ---"
sudo ss -tlnp | grep LISTEN

echo ""
echo "--- Последние логи ---"
sudo tail -5 /var/log/syslog
