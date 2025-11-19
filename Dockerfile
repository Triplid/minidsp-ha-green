ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:latest
FROM ${BUILD_FROM}

RUN apk add --no-cache python3 \
    && python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --no-cache-dir flask

COPY api.py /app/api.py
COPY rootfs/ /
WORKDIR /app