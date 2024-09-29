/*
  Warnings:

  - You are about to drop the column `usuario_id_publico` on the `usuarios_administradores` table. All the data in the column will be lost.
  - You are about to drop the column `usuario_id_publico` on the `usuarios_funcionarios` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[usuario_admin_usuario_id_publico]` on the table `usuarios_administradores` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[usuario_funcionario_usuario_id_publico]` on the table `usuarios_funcionarios` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `usuario_admin_usuario_id_publico` to the `usuarios_administradores` table without a default value. This is not possible if the table is not empty.
  - Added the required column `usuario_funcionario_usuario_id_publico` to the `usuarios_funcionarios` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "usuarios_administradores" DROP CONSTRAINT "usuarios_administradores_usuario_id_publico_fkey";

-- DropForeignKey
ALTER TABLE "usuarios_funcionarios" DROP CONSTRAINT "usuarios_funcionarios_usuario_id_publico_fkey";

-- DropIndex
DROP INDEX "usuarios_administradores_usuario_id_publico_key";

-- DropIndex
DROP INDEX "usuarios_funcionarios_usuario_id_publico_key";

-- AlterTable
ALTER TABLE "usuarios_administradores" DROP COLUMN "usuario_id_publico",
ADD COLUMN     "usuario_admin_usuario_id_publico" VARCHAR(255) NOT NULL;

-- AlterTable
ALTER TABLE "usuarios_funcionarios" DROP COLUMN "usuario_id_publico",
ADD COLUMN     "usuario_funcionario_usuario_id_publico" VARCHAR(255) NOT NULL;

-- CreateTable
CREATE TABLE "usuarios_clientes" (
    "id" SERIAL NOT NULL,
    "usuario_cliente_id_publico" VARCHAR(255) NOT NULL,
    "usuario_cliente_usuario_id_publico" VARCHAR(255) NOT NULL,
    "usuario_cliente_data_criado" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "usuario_cliente_data_atualizado" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "usuarios_clientes_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_clientes_usuario_cliente_id_publico_key" ON "usuarios_clientes"("usuario_cliente_id_publico");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_clientes_usuario_cliente_usuario_id_publico_key" ON "usuarios_clientes"("usuario_cliente_usuario_id_publico");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_administradores_usuario_admin_usuario_id_publico_key" ON "usuarios_administradores"("usuario_admin_usuario_id_publico");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_funcionarios_usuario_funcionario_usuario_id_public_key" ON "usuarios_funcionarios"("usuario_funcionario_usuario_id_publico");

-- AddForeignKey
ALTER TABLE "usuarios_administradores" ADD CONSTRAINT "usuarios_administradores_usuario_admin_usuario_id_publico_fkey" FOREIGN KEY ("usuario_admin_usuario_id_publico") REFERENCES "usuarios"("usuario_id_publico") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_funcionarios" ADD CONSTRAINT "usuarios_funcionarios_usuario_funcionario_usuario_id_publi_fkey" FOREIGN KEY ("usuario_funcionario_usuario_id_publico") REFERENCES "usuarios"("usuario_id_publico") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_clientes" ADD CONSTRAINT "usuarios_clientes_usuario_cliente_usuario_id_publico_fkey" FOREIGN KEY ("usuario_cliente_usuario_id_publico") REFERENCES "usuarios"("usuario_id_publico") ON DELETE RESTRICT ON UPDATE CASCADE;
