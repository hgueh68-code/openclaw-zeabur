FROM ghcr.io/openclaw/openclaw:latest

# Expose Gateway port
EXPOSE 18789

# Default command - start the gateway with LAN binding for Zeabur
CMD ["openclaw", "gateway", "--port", "18789", "--bind", "0.0.0.0"]
