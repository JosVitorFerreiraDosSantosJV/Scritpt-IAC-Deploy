# 🚀 Deploy Automático de Portfólio com Docker

Este projeto é um script Bash que automatiza o processo de deploy de um site estático (como um portfólio) utilizando Docker e Docker Compose. Ideal para quem quer colocar seu projeto no ar de forma rápida e profissional com apenas **um comando**!

---

## 📦 O que o script faz?

✅ Atualiza pacotes da máquina (apt update & upgrade)  
🐳 Instala Docker e Docker Compose  
🧠 Verifica dependências (como Git)  
📂 Clona o repositório do GitHub  
🌐 Sobe um container Nginx com seu portfólio dentro

---

## 🚀 Como usar
Cole o link do seu repositório quando pedir!
bash
bash deploy-portifolio.sh https://github.com/SEU_USUARIO/SEU_REPOSITORIO

⚠️ Importante!
Antes de rodar o script, certifique-se de que o caminho abaixo existe e contém seu portfólio ou site estático:
./meu-portifolio/portifolio/index.html

Note que a última pasta portifolio é a que leva até o arquivo `index.html`, que é exatamente o que o Nginx vai buscar para exibir no navegador.
Se essa pasta não existir ou estiver vazia, o Nginx poderá mostrar uma página em branco ou erro 403.





