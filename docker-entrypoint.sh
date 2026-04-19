#!/bin/sh
# Railway injects PORT at runtime — set N8N_PORT from it
export N8N_PORT="${PORT:-5678}"
export N8N_PROTOCOL="https"
export N8N_HOST="0.0.0.0"

# Set webhook URL from Railway static URL if available
if [ -n "$RAILWAY_STATIC_URL" ]; then
  export WEBHOOK_URL="https://${RAILWAY_STATIC_URL}"
fi

echo "Starting n8n on port ${N8N_PORT}..."
exec n8n start

