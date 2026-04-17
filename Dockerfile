FROM itzg/minecraft-server:java21

# Instalação do Filebrowser (Gerenciador de Arquivos Web)
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV EULA=TRUE
ENV TYPE=FABRIC
ENV VERSION=1.21.1

# Memória (6GB para aguentar o modpack de 1GB)
ENV MEMORY=6G

# Modpack Customizado (GitHub Release)
ENV GENERIC_PACK=https://github.com/ryanpichiteli/cobleverse/releases/download/bucetao/Cobleverse.dos.Crias.1.0.0.zip
ENV SKIP_GENERIC_PACK_UPDATE_CHECK=true

# RCON e Operadores
ENV ENABLE_RCON=true
ENV RCON_PASSWORD=cobleverse_admin
ENV RCON_PORT=25575
ENV OPS=leozingfa,TiaNekoXD,ryanoutk

# Portas (A porta 8080 é para o Painel Web)
EXPOSE 25565
EXPOSE 25575
EXPOSE 8080

# Adicionar script de inicialização robusto
COPY run-server.sh /usr/local/bin/run-server.sh
RUN chmod +x /usr/local/bin/run-server.sh

# Comando final
CMD ["/usr/local/bin/run-server.sh"]
