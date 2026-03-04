FROM ghcr.io/openclaw/openclaw:2026.2.26

USER root

# Copy config to staging location (outside the volume mount path)
COPY openclaw.json /app/openclaw.json

# Create minimal entrypoint inline (avoids Windows CRLF)
RUN printf '#!/bin/sh\nset -e\nmkdir -p /home/node/.openclaw\ncp -f /app/openclaw.json /home/node/.openclaw/openclaw.json\nexport OPENCLAW_CONFIG_PATH=/home/node/.openclaw/openclaw.json\nexport OPENCLAW_STATE_DIR=/home/node/.openclaw\nexec openclaw gateway --bind ${OPENCLAW_GATEWAY_BIND:-lan} --port ${PORT:-18789} --allow-unconfigured\n' > /app/entrypoint.sh && chmod +x /app/entrypoint.sh

EXPOSE 18789

CMD ["/app/entrypoint.sh"]
