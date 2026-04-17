FROM itzg/minecraft-server

ENV EULA=TRUE
ENV TYPE=FABRIC
ENV VERSION=1.20.1

# Memória (Railway limita, então segura aqui)
ENV MEMORY=4G

# Mods
ENV MODRINTH_PROJECTS=cobblemon

# Porta
EXPOSE 25565