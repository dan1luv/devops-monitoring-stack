# DevOps Monitoring Stack

Учебный проект — система мониторинга сервера.

## Скрипты

| Скрипт | Описание | Частота |
|--------|----------|---------|
| analyze_log.sh | Анализ логов | каждые 5 минут |
| check-service.sh | Проверка сервисов | каждые 10 минут |
| health_check.sh | Health check | каждые 30 минут |
| disk-check.sh | Мониторинг диска | каждый час |
| memory-check.sh | Мониторинг памяти | каждый час |
| server-report.sh | Отчёт о сервере | каждый день в 9:00 |
| backup.sh | Бэкап репозитория | каждую ночь в 00:00 |

## Стек

- Ubuntu Server 26.04 ARM64
- Docker + Docker Compose
- nginx reverse proxy
- GitHub Actions CI/CD
- Self-hosted runner

тестовая запись
