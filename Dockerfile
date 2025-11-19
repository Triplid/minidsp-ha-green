ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:latest
FROM ${BUILD_FROM}

# Установка Python и создание виртуального окружения
RUN apk add --no-cache python3 py3-pip \
    && python3 -m venv /opt/venv

# Копируем requirements.txt (если есть) или устанавливаем Flask напрямую
COPY requirements.txt /tmp/requirements.txt
RUN /opt/venv/bin/pip install --no-cache-dir -r /tmp/requirements.txt

# Или если у вас нет requirements.txt, установите Flask напрямую:
# RUN /opt/venv/bin/pip install --no-cache-dir flask

COPY api.py /app/api.py
COPY rootfs/ /
WORKDIR /app
