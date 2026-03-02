FROM ghcr.io/openclaw/openclaw:latest

USER root
WORKDIR /app

# Copy config and start script
COPY openclaw.json /app/openclaw.json
COPY start.sh /app/start.sh

# Make start script executable
RUN chmod +x /app/start.sh

# Switch back to node user to prevent permission issues
USER node

# Expose Gateway port
EXPOSE 18789

# Run through our startup script to handle the volume mount override
CMD ["/app/start.sh"]
