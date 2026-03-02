FROM ghcr.io/openclaw/openclaw:latest

USER root

# Copy config to a safe location outside the volume mount path
COPY openclaw.json /app/openclaw.json

# Create an entrypoint script INLINE to avoid Windows CRLF issues
RUN printf '#!/bin/sh\n\
    mkdir -p /home/node/.openclaw\n\
    cp -f /app/openclaw.json /home/node/.openclaw/openclaw.json\n\
    chown -R node:node /home/node/.openclaw\n\
    exec su -s /bin/sh node -c "openclaw gateway --port 18789 --bind 0.0.0.0 --allow-unconfigured"\n' > /app/start.sh && chmod +x /app/start.sh

EXPOSE 18789

CMD ["/app/start.sh"]
