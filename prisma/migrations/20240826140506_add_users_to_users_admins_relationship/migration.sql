-- CreateTable
CREATE TABLE "usuarios_administradores" (
    "id" SERIAL NOT NULL,
    "usuario_admin_id_publico" VARCHAR(255) NOT NULL,
    "usuario_id_publico" VARCHAR(255) NOT NULL,
    "usuario_admin_data_criado" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "usuario_admin_data_atualizado" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "usuarios_administradores_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_administradores_usuario_admin_id_publico_key" ON "usuarios_administradores"("usuario_admin_id_publico");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_administradores_usuario_id_publico_key" ON "usuarios_administradores"("usuario_id_publico");

-- AddForeignKey
ALTER TABLE "usuarios_administradores" ADD CONSTRAINT "usuarios_administradores_usuario_id_publico_fkey" FOREIGN KEY ("usuario_id_publico") REFERENCES "usuarios"("usuario_id_publico") ON DELETE RESTRICT ON UPDATE CASCADE;
