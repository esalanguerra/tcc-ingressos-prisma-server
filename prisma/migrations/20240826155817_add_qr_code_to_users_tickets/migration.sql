/*
  Warnings:

  - Added the required column `usuario_ingresso_qr_code` to the `usuarios_ingressos` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "usuarios_ingressos" ADD COLUMN     "usuario_ingresso_qr_code" VARCHAR(255) NOT NULL;
