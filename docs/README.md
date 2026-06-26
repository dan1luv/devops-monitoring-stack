# DevOps Monitoring Stack

Автоматический мониторинг доступности сайтов с полным DevOps стеком.

## Стек
- **Python** — скрипт мониторинга
- **Docker** — контейнеризация
- **Docker Compose** — локальный запуск
- **Kubernetes** — оркестрация в продакшене
- **Terraform** — инфраструктура как код
- **GitHub Actions** — CI/CD пайплайн

## Быстрый старт

### Локально через Docker Compose
```bash
docker compose up
```
Открой http://localhost:8080

### Запуск в Kubernetes
```bash
kubectl apply -f k8s/
kubectl get pods
```

### Запуск мониторинга напрямую
```bash
docker run dan1luv/devops-monitor:v1
```

## Архитектура
git push

↓

GitHub Actions (CI/CD)

↓

Сборка Docker образа

↓

Push на Docker Hub

↓

Деплой в Kubernetes
## Автор
Evgeny Danilov — github.com/dan1luv
