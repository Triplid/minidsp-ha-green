ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:latest
FROM ${BUILD_FROM}

# Устанавливаем Flask через системный пакетный менеджер
RUN apk add --no-cache python3 py3-flask

COPY api.py /app/api.py
COPY rootfs/ /
WORKDIR /app
