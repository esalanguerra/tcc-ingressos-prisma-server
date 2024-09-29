/*
  Warnings:

  - A unique constraint covering the columns `[ingresso_evento_id_publico]` on the table `ingressos` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `ingresso_evento_id_publico` to the `ingressos` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ingressos" ADD COLUMN     "ingresso_evento_id_publico" VARCHAR(255) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "ingressos_ingresso_evento_id_publico_key" ON "ingressos"("ingresso_evento_id_publico");

-- AddForeignKey
ALTER TABLE "ingressos" ADD CONSTRAINT "ingressos_ingresso_evento_id_publico_fkey" FOREIGN KEY ("ingresso_evento_id_publico") REFERENCES "eventos"("evento_id_publico") ON DELETE RESTRICT ON UPDATE CASCADE;
