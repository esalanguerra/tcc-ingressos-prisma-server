-- CreateTable
CREATE TABLE "usuarios" (
    "id" SERIAL NOT NULL,
    "usuario_id_publico" VARCHAR(255) NOT NULL,
    "usuario_nome" VARCHAR(255) NOT NULL,
    "usuario_email" VARCHAR(255) NOT NULL,
    "usuario_senha" VARCHAR(255) NOT NULL,
    "usuario_telefone" VARCHAR(255) NOT NULL,
    "usuario_endereco" VARCHAR(255) NOT NULL,
    "usuario_data_criado" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "usuario_data_atualizado" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_usuario_id_publico_key" ON "usuarios"("usuario_id_publico");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_usuario_email_key" ON "usuarios"("usuario_email");
