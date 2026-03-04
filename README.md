---
title: OpenClaw Gateway
sdk: docker
app_port: 18789
pinned: false
---

# OpenClaw on Hugging Face Spaces

This Space runs OpenClaw Gateway using Docker.

## Required Space Secrets

- `OLLAMA_API_KEY_1`: Primary Ollama API key.
- `OLLAMA_API_KEY_2`: Secondary Ollama API key (used as failover when key 1 is rate-limited).
- `TELEGRAM_BOT_TOKEN`: Telegram bot token (if Telegram channel is enabled).
- `BRAVE_API_KEY`: Brave Search API key (optional, for web search tool).
- `OPENCLAW_GATEWAY_TOKEN`: Gateway auth token used by dashboard/control connections.
- `OPENCLAW_GATEWAY_BIND`: set to `lan`.

## Notes

- The service listens on port `18789`.
- Configure secrets in Space Settings -> Variables and secrets.
- For production stability, keep one deployment target active at a time.
