/*
  Warnings:

  - Added the required column `checkout_usuario_id_publico` to the `checkouts` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "checkouts" ADD COLUMN     "checkout_usuario_id_publico" VARCHAR(255) NOT NULL;

-- AddForeignKey
ALTER TABLE "checkouts" ADD CONSTRAINT "checkouts_checkout_usuario_id_publico_fkey" FOREIGN KEY ("checkout_usuario_id_publico") REFERENCES "usuarios_clientes"("usuario_cliente_id_publico") ON DELETE RESTRICT ON UPDATE CASCADE;
