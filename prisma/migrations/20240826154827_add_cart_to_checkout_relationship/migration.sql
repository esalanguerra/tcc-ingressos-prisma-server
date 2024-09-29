/*
  Warnings:

  - A unique constraint covering the columns `[checkout_carrinho_id_publico]` on the table `checkouts` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `checkout_carrinho_id_publico` to the `checkouts` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "checkouts" ADD COLUMN     "checkout_carrinho_id_publico" VARCHAR(255) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "checkouts_checkout_carrinho_id_publico_key" ON "checkouts"("checkout_carrinho_id_publico");

-- AddForeignKey
ALTER TABLE "checkouts" ADD CONSTRAINT "checkouts_checkout_carrinho_id_publico_fkey" FOREIGN KEY ("checkout_carrinho_id_publico") REFERENCES "carrinhos"("carrinho_id_publico") ON DELETE RESTRICT ON UPDATE CASCADE;
