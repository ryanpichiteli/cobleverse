FROM itzg/minecraft-server

ENV EULA=TRUE
ENV TYPE=FABRIC
ENV VERSION=1.20.1

# Memória (Railway limita, então segura aqui)
ENV MEMORY=4G

# Mods e Dependências
ENV MODRINTH_PROJECTS=cobblemon,fabric-api,architectury-api
ENV MODRINTH_DOWNLOAD_DEPENDENCIES=required

# Porta
EXPOSE 25565
