ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:latest
FROM ${BUILD_FROM}

# Устанавливаем python3 и venv
RUN apk add --no-cache python3 py3-pip bash \
    && python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --upgrade pip \
    && /opt/venv/bin/pip install --no-cache-dir flask

# Копируем приложение
COPY api.py /app/api.py
COPY rootfs/ /

WORKDIR /app
