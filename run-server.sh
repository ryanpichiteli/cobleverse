#!/bin/bash

# Log com data/hora
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [BOOT] $1"
}

log "Sincronizando permissões da pasta /data..."
# Garante que o banco de dados do Filebrowser possa ser escrito
touch /data/fb.db
chmod 666 /data/fb.db

log "Iniciando Painel de Arquivos (Filebrowser) na porta 8080..."
# Inicia o Filebrowser em background
filebrowser -r /data -p 8080 --database /data/fb.db --noauth=false &

log "Iniciando Servidor de Minecraft..."
# Inicia o servidor de Minecraft em foreground (passando o controle total para o /start)
exec /start
