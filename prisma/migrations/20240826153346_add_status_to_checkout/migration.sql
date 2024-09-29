/*
  Warnings:

  - You are about to drop the column `usuario_data_atualizado` on the `checkouts` table. All the data in the column will be lost.
  - You are about to drop the column `usuario_data_criado` on the `checkouts` table. All the data in the column will be lost.
  - Added the required column `checkout_data_atualizado` to the `checkouts` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "CHECKOUT_STATUS" AS ENUM ('PENDING', 'PAID', 'CANCELED');

-- AlterTable
ALTER TABLE "checkouts" DROP COLUMN "usuario_data_atualizado",
DROP COLUMN "usuario_data_criado",
ADD COLUMN     "checkout_data_atualizado" TIMESTAMP(6) NOT NULL,
ADD COLUMN     "checkout_data_criado" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "checkout_status" "CHECKOUT_STATUS" NOT NULL DEFAULT 'PENDING';
