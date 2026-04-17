#!/bin/bash

# Log com data/hora
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [FILEBROWSER-HOOK] $1"
}

log "Sincronizando permissões do banco de dados..."
touch /data/fb.db
chmod 666 /data/fb.db

log "Iniciando Painel de Arquivos em background (porta 8080)..."
# Inicia o Filebrowser ouvindo em 0.0.0.0
filebrowser -a 0.0.0.0 -r /data -p 8080 --database /data/fb.db --noauth=false &

log "Hook concluído. O servidor de Minecraft inciará em seguida."
