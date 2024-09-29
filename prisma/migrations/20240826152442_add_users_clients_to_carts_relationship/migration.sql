/*
  Warnings:

  - A unique constraint covering the columns `[carrinho_usuario_id_publico]` on the table `carrinhos` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `carrinho_usuario_id_publico` to the `carrinhos` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "carrinhos" ADD COLUMN     "carrinho_usuario_id_publico" VARCHAR(255) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "carrinhos_carrinho_usuario_id_publico_key" ON "carrinhos"("carrinho_usuario_id_publico");

-- AddForeignKey
ALTER TABLE "carrinhos" ADD CONSTRAINT "carrinhos_carrinho_usuario_id_publico_fkey" FOREIGN KEY ("carrinho_usuario_id_publico") REFERENCES "usuarios_clientes"("usuario_cliente_id_publico") ON DELETE RESTRICT ON UPDATE CASCADE;
