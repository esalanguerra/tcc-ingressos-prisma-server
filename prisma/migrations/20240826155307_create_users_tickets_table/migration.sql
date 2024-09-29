-- CreateEnum
CREATE TYPE "USER_TICKET_STATUS" AS ENUM ('ACTIVE', 'INACTIVE');

-- CreateTable
CREATE TABLE "usuarios_ingressos" (
    "id" SERIAL NOT NULL,
    "usuario_ingresso_id_publico" VARCHAR(255) NOT NULL,
    "usuario_ingresso_data_criado" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "usuario_ingresso_data_atualizado" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "usuarios_ingressos_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_ingressos_usuario_ingresso_id_publico_key" ON "usuarios_ingressos"("usuario_ingresso_id_publico");
