-- CreateTable
CREATE TABLE "eventos" (
    "id" SERIAL NOT NULL,
    "evento_id_publico" VARCHAR(255) NOT NULL,
    "evento_nome" VARCHAR(255) NOT NULL,
    "evento_descricao" VARCHAR(255) NOT NULL,
    "evento_imagem_url" VARCHAR(255) NOT NULL,
    "evento_endereco" VARCHAR(255) NOT NULL,
    "evento_usuario_admin_id_publico" VARCHAR(255) NOT NULL,
    "evento_data_inicio" TIMESTAMP(6) NOT NULL,
    "evento_data_fim" TIMESTAMP(6) NOT NULL,
    "evento_data_criado" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "evento_data_atualizado" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "eventos_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "eventos_evento_id_publico_key" ON "eventos"("evento_id_publico");
