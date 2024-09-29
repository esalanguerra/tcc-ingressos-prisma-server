-- CreateTable
CREATE TABLE "checkouts" (
    "id" SERIAL NOT NULL,
    "checkout_id_publico" VARCHAR(255) NOT NULL,
    "usuario_data_criado" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "usuario_data_atualizado" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "checkouts_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "checkouts_checkout_id_publico_key" ON "checkouts"("checkout_id_publico");
