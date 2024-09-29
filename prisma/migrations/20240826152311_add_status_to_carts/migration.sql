-- CreateEnum
CREATE TYPE "CART_STATUS" AS ENUM ('OPEN', 'CLOSED');

-- AlterTable
ALTER TABLE "carrinhos" ADD COLUMN     "carrinho_status" "CART_STATUS" NOT NULL DEFAULT 'OPEN';
