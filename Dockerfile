# Dockerfile para Railway - OpenClaw Gateway + Site Now4real
FROM node:23-bookworm-slim

WORKDIR /app

# Instalar dependências do sistema para o OpenClaw
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Instalar OpenClaw
RUN npm install -g openclaw

# Criar workspace
RUN mkdir -p /data/workspace/main/site /data/.openclaw

# Configurar entrypoint customizado
COPY server.js /app/server.js
COPY index.html /app/site-index.html

# Expor porta
EXPOSE 8080

# Iniciar servidor (que inicia Gateway + site)
CMD ["node", "/app/server.js"]
