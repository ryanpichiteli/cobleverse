#!/bin/bash

# Log com data/hora para depuração
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [BOOT-WRAPPER] $1"
}

log "Iniciando a preparação do contêiner..."

# Garante que o banco de dados do Filebrowser possa ser escrito
touch /data/fb.db
chmod 666 /data/fb.db

log "Iniciando Gerenciador de Arquivos (Filebrowser) na porta 8080..."
# Inicia em background (removido --shell que causou erro)
filebrowser -a 0.0.0.0 -r /data -p 8080 --database /data/fb.db --noauth=false &

# Aguarda o painel subir e força a ativação do terminal no banco de dados
sleep 5
filebrowser config set --shell bash --database /data/fb.db

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
