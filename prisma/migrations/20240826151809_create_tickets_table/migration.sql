-- CreateTable
CREATE TABLE "ingressos" (
    "id" SERIAL NOT NULL,
    "ingresso_id_publico" VARCHAR(255) NOT NULL,
    "ingresso_nome" VARCHAR(255) NOT NULL,
    "ingresso_preco" REAL NOT NULL,
    "ingresso_quantidade" INTEGER NOT NULL,
    "ingresso_data_criado" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ingresso_data_atualizado" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "ingressos_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ingressos_ingresso_id_publico_key" ON "ingressos"("ingresso_id_publico");
