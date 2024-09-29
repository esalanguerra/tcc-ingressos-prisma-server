-- CreateTable
CREATE TABLE "_cartsToevents" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_cartsToevents_AB_unique" ON "_cartsToevents"("A", "B");

-- CreateIndex
CREATE INDEX "_cartsToevents_B_index" ON "_cartsToevents"("B");

-- AddForeignKey
ALTER TABLE "_cartsToevents" ADD CONSTRAINT "_cartsToevents_A_fkey" FOREIGN KEY ("A") REFERENCES "carrinhos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_cartsToevents" ADD CONSTRAINT "_cartsToevents_B_fkey" FOREIGN KEY ("B") REFERENCES "eventos"("id") ON DELETE CASCADE ON UPDATE CASCADE;
