#!/bin/bash
echo "=== Статус контейнеров ==="
docker ps

echo ""
echo "=== Использование ресурсов ==="
docker stats --no-stream

echo ""
echo "=== Последние логи ==="
docker compose -f ~/devops-monitoring-stack/docker-compose.yml logs --tail=3
