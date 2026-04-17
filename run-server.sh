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
# Inicia em background e ouvindo em 0.0.0.0
filebrowser -a 0.0.0.0 -r /data -p 8080 --database /data/fb.db --noauth=false &

log "Passando o controle para o entrypoint original do Minecraft..."
# exec chama o entrypoint original e passa todos os argumentos ($@)
exec entrypoint-demux "$@"
