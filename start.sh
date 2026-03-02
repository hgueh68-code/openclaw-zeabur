#!/bin/sh

echo "Initialising OpenClaw setup..."

# Ensure the .openclaw directory exists in the persistent volume
mkdir -p /home/node/.openclaw

# Force copy the config into the mounted volume
echo "Copying config..."
cp -f /app/openclaw.json /home/node/.openclaw/openclaw.json

echo "Starting OpenClaw gateway on 0.0.0.0:18789"
exec openclaw gateway --port 18789 --bind 0.0.0.0 --allow-unconfigured
