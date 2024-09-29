-- CreateTable
CREATE TABLE "_eventsTousers_staffs" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_eventsTousers_staffs_AB_unique" ON "_eventsTousers_staffs"("A", "B");

-- CreateIndex
CREATE INDEX "_eventsTousers_staffs_B_index" ON "_eventsTousers_staffs"("B");

-- AddForeignKey
ALTER TABLE "_eventsTousers_staffs" ADD CONSTRAINT "_eventsTousers_staffs_A_fkey" FOREIGN KEY ("A") REFERENCES "eventos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_eventsTousers_staffs" ADD CONSTRAINT "_eventsTousers_staffs_B_fkey" FOREIGN KEY ("B") REFERENCES "usuarios_funcionarios"("id") ON DELETE CASCADE ON UPDATE CASCADE;
