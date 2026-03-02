#!/bin/sh

# Ensure the config exists in the volume (Zeabur volume mount hides the image's files)
cp /app/openclaw.json /home/node/.openclaw/openclaw.json

# Start the OpenClaw gateway
exec openclaw gateway --port 18789 --bind 0.0.0.0
