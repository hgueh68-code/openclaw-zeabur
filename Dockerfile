FROM ghcr.io/openclaw/openclaw:latest

USER root

# Copy config to staging location (outside the volume mount path)
COPY openclaw.json /app/openclaw.json

# Create minimal entrypoint inline (avoids Windows CRLF)
RUN printf '#!/bin/sh\nset -e\nmkdir -p /home/node/.openclaw\ncp -f /app/openclaw.json /home/node/.openclaw/openclaw.json\nchown -R node:node /home/node/.openclaw\nexec openclaw gateway --bind lan --port ${PORT:-18789}\n' > /app/entrypoint.sh && chmod +x /app/entrypoint.sh

EXPOSE 18789

CMD ["/app/entrypoint.sh"]
