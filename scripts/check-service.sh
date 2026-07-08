#!/bin/bash
SERVICE=$1

if [ -z "$SERVICE" ]; then
    echo "Использование: $0 <сервис>"
    exit 1
fi

check_all() {
    local services=("nginx" "docker" "cron" "ssh")
    echo "=== Проверка всех сервисов ==="
    for service in "${services[@]}"; do
        if systemctl is-active --quiet $service; then
            echo "✓ $service"
        else
            echo "✗ $service — STOPPED"
        fi
    done
}

if [ "$1" = "all" ]; then
    check_all
    exit 0
fi

if systemctl is-active --quiet $SERVICE; then
    echo "✓ $SERVICE — OK"
else
    echo "✗ $SERVICE — STOPPED, запускаю..."
    sudo systemctl start $SERVICE
    echo "✓ $SERVICE — запущен"
fi
# Эта строка не добавится — файл уже перезаписан через >
