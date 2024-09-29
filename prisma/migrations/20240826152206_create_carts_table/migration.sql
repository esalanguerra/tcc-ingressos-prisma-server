-- CreateTable
CREATE TABLE "carrinhos" (
    "id" SERIAL NOT NULL,
    "carrinho_id_publico" VARCHAR(255) NOT NULL,
    "carrinho_data_criado" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "carrinho_data_atualizado" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "carrinhos_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "carrinhos_carrinho_id_publico_key" ON "carrinhos"("carrinho_id_publico");
