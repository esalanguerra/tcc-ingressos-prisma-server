-- CreateTable
CREATE TABLE "_cartsTotickets" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_cartsTotickets_AB_unique" ON "_cartsTotickets"("A", "B");

-- CreateIndex
CREATE INDEX "_cartsTotickets_B_index" ON "_cartsTotickets"("B");

-- AddForeignKey
ALTER TABLE "_cartsTotickets" ADD CONSTRAINT "_cartsTotickets_A_fkey" FOREIGN KEY ("A") REFERENCES "carrinhos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_cartsTotickets" ADD CONSTRAINT "_cartsTotickets_B_fkey" FOREIGN KEY ("B") REFERENCES "ingressos"("id") ON DELETE CASCADE ON UPDATE CASCADE;
