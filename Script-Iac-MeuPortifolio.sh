#!/bin/bash

echo "Atualizando o servidor..."
sudo apt-get update
sudo apt-get upgrade -y

echo "Instalando Docker..."
sudo apt-get install -y docker.io

echo "Instalando Docker Compose..."
DOCKER_COMPOSE_VERSION="2.18.1"
sudo curl -L "https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Criando diretório do projeto..."
mkdir -p ~/meu-projeto/meu-portifolio

echo "Verificando se o Git está instalado..."
if command -v git >/dev/null 2>&1; then
    echo "Git já está instalado."
else
    echo "Git não encontrado. Instalando Git..."
    sudo apt-get install -y git
fi

echo "Copiando arquivos do portfólio para ~/meu-projeto/meu-portifolio"
# Se estiver local, copie usando scp para o servidor antes de rodar esse script

while true; do
    read -p "Digite o link do repositório Git do seu portfólio (ex: https://github.com/usuario/repositorio.git): " repo_link

    if [[ "$repo_link" == https://github.com/* ]]; then
        # Verifica se já existe um repositório e remove
        if [ -d ~/meu-projeto/meu-portifolio/.git ]; then
            echo "🧼 Removendo repositório anterior..."
            rm -rf ~/meu-projeto/meu-portifolio
        fi

        echo "📥 Clonando repositório..."
        git clone "$repo_link" ~/meu-projeto/meu-portifolio && break || echo "❌ Erro ao clonar o repositório. Verifique se o link está correto ou se é público."
    else
        echo "❌ Link inválido. Ele deve começar com https://github.com/"
    fi
done

echo "Criando docker-compose.yml..."
cat > ~/meu-projeto/docker-compose.yml <<EOF
version: '3.8'

services:
  web:
    image: nginx:alpine
    ports:
      - "8080:80"
    volumes:
      - ./meu-portifolio/portilofio:/usr/share/nginx/html:ro
    networks:
      - webnet

networks:
  webnet:
EOF

echo "Subindo container com docker-compose..."
cd ~/meu-projeto
docker-compose up -d

echo "✅ Pronto! Acesse http://localhost:8080 (ou o IP do servidor na porta 8080)"

