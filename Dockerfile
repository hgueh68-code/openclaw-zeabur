FROM ghcr.io/openclaw/openclaw:latest

# Switch to root to setup permissions
USER root
WORKDIR /app

# Copy the config and start script
COPY openclaw.json /app/openclaw.json
COPY start.sh /app/start.sh

# Make start script executable and give node user ownership
RUN chmod +x /app/start.sh && chown -R node:node /app

# Switch back strictly to node user
USER node

# Expose Gateway port
EXPOSE 18789

# Run the startup script
CMD ["/app/start.sh"]
