FROM ghcr.io/openclaw/openclaw:latest

# Set the OPENCLAW_CONFIG environment variable to point to our included config
# so we don't rely on the persistent volume for the main config file
ENV OPENCLAW_CONFIG=/app/openclaw.json

WORKDIR /app

# Copy the config directly into the container
COPY openclaw.json /app/openclaw.json

# Expose Gateway port
EXPOSE 18789

# Start with --allow-unconfigured to bypass any strict startup checks
CMD ["openclaw", "gateway", "--port", "18789", "--bind", "0.0.0.0", "--allow-unconfigured"]
