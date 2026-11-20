# Local-only infrastructure (Docker)

PostgreSQL 18, Redis 8 and Vault run ONLY in Docker. No NixOS PostgreSQL,
Redis or Vault host services are enabled.

Copy `.env.example` to `.env` and change its passwords before running:

```fish
cd infra/docker
cp .env.example .env
$EDITOR .env
docker compose up -d
```

All ports bind to 127.0.0.1 only. Compose will download images ON FIRST RUN.
These images and their volumes still consume disk space. Vault requires a
manual one-time initialization/unseal; this is NOT a production Vault config.
Do not paste production tokens or company credentials into compose files.
Use proper TLS, storage backend, and key custody for any non-local deployment.
