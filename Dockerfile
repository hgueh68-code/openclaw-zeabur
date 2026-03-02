FROM ghcr.io/openclaw/openclaw:latest

USER root

# Copy config to a safe location
COPY openclaw.json /app/openclaw.json

# Create entrypoint inline (avoids Windows CRLF)
# Simple: just copy config, fix permissions, and exec as node user using gosu
RUN printf '#!/bin/sh\nset -e\nmkdir -p /home/node/.openclaw\ncp -f /app/openclaw.json /home/node/.openclaw/openclaw.json\nchown -R node:node /home/node/.openclaw\nexec gosu node openclaw gateway --port 18789 --bind lan --allow-unconfigured\n' > /app/start.sh && chmod +x /app/start.sh

# Check if gosu exists, if not install it; also try without gosu as fallback
RUN if ! command -v gosu > /dev/null 2>&1; then \
    printf '#!/bin/sh\nset -e\nmkdir -p /home/node/.openclaw\ncp -f /app/openclaw.json /home/node/.openclaw/openclaw.json\nchown -R node:node /home/node/.openclaw\nexec openclaw gateway --port 18789 --bind lan --allow-unconfigured\n' > /app/start.sh && chmod +x /app/start.sh; \
    fi

EXPOSE 18789

CMD ["/app/start.sh"]
