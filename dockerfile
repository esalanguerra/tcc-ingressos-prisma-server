# Escolha a imagem base do Node.js
FROM node:18

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o package.json e o package-lock.json (ou yarn.lock) para o diretório de trabalho
COPY package*.json ./

# Instala as dependências do projeto
RUN npm install

# Copia o restante dos arquivos do projeto para o diretório de trabalho
COPY . .

# Expõe a porta que a aplicação irá rodar
EXPOSE 5555

RUN npx prisma generate

# Define o comando que será executado quando o contêiner iniciar
CMD ["npm", "run", "prisma:server"]