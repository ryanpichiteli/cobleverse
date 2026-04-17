FROM itzg/minecraft-server:java17

ENV EULA=TRUE
ENV TYPE=FABRIC
ENV VERSION=1.20.1

# Memória (Railway limita, então segura aqui)
ENV MEMORY=4G

# Mods e Dependências
ENV MODRINTH_PROJECTS=cobblemon,fabric-api,architectury-api
ENV MODRINTH_DOWNLOAD_DEPENDENCIES=required

# RCON (Console Remoto)
ENV ENABLE_RCON=true
ENV RCON_PASSWORD=cobleverse_admin
ENV RCON_PORT=25575

# Portas (Minecraft e RCON)
EXPOSE 25565
EXPOSE 25575
