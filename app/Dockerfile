FROM python:3.12-slim

WORKDIR /app

COPY monitor.py .

RUN pip install certifi --no-cache-dir

CMD ["python3", "monitor.py"]
