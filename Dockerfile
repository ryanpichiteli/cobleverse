FROM itzg/minecraft-server:java21

ENV EULA=TRUE
ENV TYPE=FABRIC
ENV VERSION=1.21.1

# Memória (6GB para aguentar o modpack de 1GB)
ENV MEMORY=6G

# Modpack Customizado (GitHub Release)
ENV GENERIC_PACK=https://github.com/ryanpichiteli/cobleverse/releases/download/piru/Cobleverse.dos.Crias.1.0.0.zip
ENV SKIP_GENERIC_PACK_UPDATE_CHECK=true

# RCON e Operadores
ENV ENABLE_RCON=true
ENV RCON_PASSWORD=cobleverse_admin
ENV RCON_PORT=25575
ENV OPS=leozingfa

# Portas
EXPOSE 25565
EXPOSE 25575
