/*
  Warnings:

  - You are about to drop the column `ingresso_evento_id_publico` on the `ingressos` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[evento_ingresso_id_publico]` on the table `eventos` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `evento_ingresso_id_publico` to the `eventos` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "ingressos" DROP CONSTRAINT "ingressos_ingresso_evento_id_publico_fkey";

-- DropIndex
DROP INDEX "ingressos_ingresso_evento_id_publico_key";

-- AlterTable
ALTER TABLE "eventos" ADD COLUMN     "evento_ingresso_id_publico" VARCHAR(255) NOT NULL;

-- AlterTable
ALTER TABLE "ingressos" DROP COLUMN "ingresso_evento_id_publico";

-- CreateIndex
CREATE UNIQUE INDEX "eventos_evento_ingresso_id_publico_key" ON "eventos"("evento_ingresso_id_publico");

-- AddForeignKey
ALTER TABLE "eventos" ADD CONSTRAINT "eventos_evento_ingresso_id_publico_fkey" FOREIGN KEY ("evento_ingresso_id_publico") REFERENCES "ingressos"("ingresso_id_publico") ON DELETE RESTRICT ON UPDATE CASCADE;
