-- CreateEnum
CREATE TYPE "EVENT_STATUS" AS ENUM ('OPEN', 'CLOSED');

-- AlterTable
ALTER TABLE "eventos" ADD COLUMN     "evento_status" "EVENT_STATUS" NOT NULL DEFAULT 'OPEN';
