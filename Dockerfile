FROM itzg/minecraft-server:java17

ENV EULA=TRUE
ENV TYPE=FABRIC
ENV VERSION=1.20.1

# Memória (6GB para aguentar o modpack de 1GB)
ENV MEMORY=6G

# Modpack Customizado (Google Drive)
ENV GENERIC_PACK=https://drive.google.com/uc?export=download&id=17S4T1QQ6lRAncNdJdU6XOw9t_vUd2FBS&confirm=t
ENV SKIP_GENERIC_PACK_UPDATE_CHECK=true

# RCON e Operadores
ENV ENABLE_RCON=true
ENV RCON_PASSWORD=cobleverse_admin
ENV RCON_PORT=25575
ENV OPS=leozingfa

# Portas
EXPOSE 25565
EXPOSE 25575
