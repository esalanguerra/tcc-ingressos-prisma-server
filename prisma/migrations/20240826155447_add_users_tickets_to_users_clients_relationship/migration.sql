/*
  Warnings:

  - Added the required column `usuario_id_publico` to the `usuarios_ingressos` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "usuarios_ingressos" ADD COLUMN     "usuario_id_publico" VARCHAR(255) NOT NULL;

-- AddForeignKey
ALTER TABLE "usuarios_ingressos" ADD CONSTRAINT "usuarios_ingressos_usuario_id_publico_fkey" FOREIGN KEY ("usuario_id_publico") REFERENCES "usuarios_clientes"("usuario_cliente_id_publico") ON DELETE RESTRICT ON UPDATE CASCADE;
