FROM n8nio/n8n:latest

# n8n runs as node user by default
USER root

# Railway injects PORT — n8n reads it via N8N_PORT
ENV N8N_PORT=${PORT:-5678}
ENV N8N_PROTOCOL=https
ENV N8N_HOST=0.0.0.0
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL:-localhost}

EXPOSE ${PORT:-5678}

CMD ["n8n", "start"]
