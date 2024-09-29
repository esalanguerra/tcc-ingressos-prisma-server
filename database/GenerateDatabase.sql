-- Criação do usuário administrador com senha e privilégios de superusuário
CREATE USER rodrigo WITH PASSWORD 'ingressosPontoComPontoBr' SUPERUSER;

-- Criação do banco de dados com codificação UTF8 e extensão UUID
CREATE DATABASE ingressos
    WITH OWNER = rodrigo
    ENCODING = 'UTF8'
    TEMPLATE = template0;

-- Conecte-se ao banco de dados recém-criado
\c ingressos

-- Habilite a extensão UUID para o banco de dados
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
