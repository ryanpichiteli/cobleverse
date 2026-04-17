#!/bin/bash

# Log com data/hora para depuração
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [BOOT-WRAPPER] $1"
}

log "Iniciando a preparação do contêiner..."

# Garante que o banco de dados do Filebrowser exista
touch /data/fb.db

log "Corrigindo permissões da pasta /data para o usuário minecraft (1000)..."
# Isso garante que mods enviados via Filebrowser sejam legíveis pelo servidor
chown -R 1000:1000 /data
chmod -R u+rwX /data

log "Configurando Gerenciador de Arquivos (Filebrowser)..."
# Configura o shell antes de iniciar o processo para evitar lock no banco de dados
filebrowser config set --shell bash --database /data/fb.db 2>/dev/null || \
filebrowser config init --database /data/fb.db && filebrowser config set --shell bash --database /data/fb.db

log "Iniciando Filebrowser na porta 8080..."
filebrowser -a 0.0.0.0 -r /data -p 8080 --database /data/fb.db --noauth=false &

log "Procurando o comando original do Minecraft..."
# Procura em locais comuns
if [ -f /usr/local/bin/entrypoint-demux ]; then
    CMD="/usr/local/bin/entrypoint-demux"
elif [ -f /usr/bin/entrypoint-demux ]; then
    CMD="/usr/bin/entrypoint-demux"
elif [ -f /entrypoint-demux ]; then
    CMD="/entrypoint-demux"
else
    # Busca profunda se não achou nos comuns
    CMD=$(find /usr /usr/local -name "entrypoint-demux" 2>/dev/null | head -n 1)
fi

if [ -n "$CMD" ]; then
    log "Comando encontrado em: $CMD. Iniciando..."
    exec "$CMD" "$@"
else
    log "AVISO: entrypoint-demux não encontrado. Tentando inicialização direta via /start..."
    exec /start
fi
