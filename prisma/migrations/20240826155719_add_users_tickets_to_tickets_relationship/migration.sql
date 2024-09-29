/*
  Warnings:

  - You are about to drop the column `usuario_id_publico` on the `usuarios_ingressos` table. All the data in the column will be lost.
  - Added the required column `usuario_ingresso_ingresso_id_publico` to the `usuarios_ingressos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `usuario_ingresso_usuario_id_publico` to the `usuarios_ingressos` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "usuarios_ingressos" DROP CONSTRAINT "usuarios_ingressos_usuario_id_publico_fkey";

-- AlterTable
ALTER TABLE "usuarios_ingressos" DROP COLUMN "usuario_id_publico",
ADD COLUMN     "usuario_ingresso_ingresso_id_publico" VARCHAR(255) NOT NULL,
ADD COLUMN     "usuario_ingresso_usuario_id_publico" VARCHAR(255) NOT NULL;

-- AddForeignKey
ALTER TABLE "usuarios_ingressos" ADD CONSTRAINT "usuarios_ingressos_usuario_ingresso_usuario_id_publico_fkey" FOREIGN KEY ("usuario_ingresso_usuario_id_publico") REFERENCES "usuarios_clientes"("usuario_cliente_id_publico") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios_ingressos" ADD CONSTRAINT "usuarios_ingressos_usuario_ingresso_ingresso_id_publico_fkey" FOREIGN KEY ("usuario_ingresso_ingresso_id_publico") REFERENCES "ingressos"("ingresso_id_publico") ON DELETE RESTRICT ON UPDATE CASCADE;
