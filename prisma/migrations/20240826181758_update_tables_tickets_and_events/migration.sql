/*
  Warnings:

  - You are about to drop the column `evento_ingresso_id_publico` on the `eventos` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "eventos" DROP CONSTRAINT "eventos_evento_ingresso_id_publico_fkey";

-- DropIndex
DROP INDEX "eventos_evento_ingresso_id_publico_key";

-- AlterTable
ALTER TABLE "eventos" DROP COLUMN "evento_ingresso_id_publico";

-- CreateTable
CREATE TABLE "_eventsTotickets" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_eventsTotickets_AB_unique" ON "_eventsTotickets"("A", "B");

-- CreateIndex
CREATE INDEX "_eventsTotickets_B_index" ON "_eventsTotickets"("B");

-- AddForeignKey
ALTER TABLE "_eventsTotickets" ADD CONSTRAINT "_eventsTotickets_A_fkey" FOREIGN KEY ("A") REFERENCES "eventos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_eventsTotickets" ADD CONSTRAINT "_eventsTotickets_B_fkey" FOREIGN KEY ("B") REFERENCES "ingressos"("id") ON DELETE CASCADE ON UPDATE CASCADE;
