FROM ghcr.io/openclaw/openclaw:latest

# Copy OpenClaw config for SambaNova + Telegram
COPY openclaw.json /home/node/.openclaw/openclaw.json

# Expose Gateway port
EXPOSE 18789

# Start the gateway bound to 0.0.0.0 so Zeabur can route traffic
CMD ["openclaw", "gateway", "--port", "18789", "--bind", "0.0.0.0"]
