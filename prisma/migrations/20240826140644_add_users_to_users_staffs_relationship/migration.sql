-- CreateTable
CREATE TABLE "usuarios_funcionarios" (
    "id" SERIAL NOT NULL,
    "usuario_funcionario_id_publico" VARCHAR(255) NOT NULL,
    "usuario_id_publico" VARCHAR(255) NOT NULL,
    "usuario_funcionario_data_criado" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "usuario_funcionario_data_atualizado" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "usuarios_funcionarios_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_funcionarios_usuario_funcionario_id_publico_key" ON "usuarios_funcionarios"("usuario_funcionario_id_publico");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_funcionarios_usuario_id_publico_key" ON "usuarios_funcionarios"("usuario_id_publico");

-- AddForeignKey
ALTER TABLE "usuarios_funcionarios" ADD CONSTRAINT "usuarios_funcionarios_usuario_id_publico_fkey" FOREIGN KEY ("usuario_id_publico") REFERENCES "usuarios"("usuario_id_publico") ON DELETE RESTRICT ON UPDATE CASCADE;
