-- CreateEnum
CREATE TYPE "TICKET_STATUS" AS ENUM ('AVAILABLE', 'SOLD_OUT');

-- AlterTable
ALTER TABLE "ingressos" ADD COLUMN     "ingresso_status" "TICKET_STATUS" NOT NULL DEFAULT 'AVAILABLE';
