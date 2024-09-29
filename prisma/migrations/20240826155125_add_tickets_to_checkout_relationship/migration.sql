-- CreateTable
CREATE TABLE "_checkoutsTotickets" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_checkoutsTotickets_AB_unique" ON "_checkoutsTotickets"("A", "B");

-- CreateIndex
CREATE INDEX "_checkoutsTotickets_B_index" ON "_checkoutsTotickets"("B");

-- AddForeignKey
ALTER TABLE "_checkoutsTotickets" ADD CONSTRAINT "_checkoutsTotickets_A_fkey" FOREIGN KEY ("A") REFERENCES "checkouts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_checkoutsTotickets" ADD CONSTRAINT "_checkoutsTotickets_B_fkey" FOREIGN KEY ("B") REFERENCES "ingressos"("id") ON DELETE CASCADE ON UPDATE CASCADE;
