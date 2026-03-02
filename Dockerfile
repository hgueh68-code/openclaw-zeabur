FROM ghcr.io/openclaw/openclaw:latest

USER root

# Copy our config to a staging location (outside the volume mount)
COPY openclaw.json /app/openclaw.json

# Create a minimal entrypoint that:
# 1. Copies config into the mounted volume
# 2. Delegates to the image's ORIGINAL startup scripts
RUN printf '#!/bin/sh\nset -e\nmkdir -p /home/node/.openclaw\ncp -f /app/openclaw.json /home/node/.openclaw/openclaw.json\nchown -R node:node /home/node/.openclaw\ncd /home/node\nexec bash -lc "/opt/openclaw/startup.sh && openclaw gateway --bind lan --port ${PORT:-18789}"\n' > /app/entrypoint.sh && chmod +x /app/entrypoint.sh

EXPOSE 18789

CMD ["/app/entrypoint.sh"]
