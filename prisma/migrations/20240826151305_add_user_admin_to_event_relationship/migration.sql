-- AddForeignKey
ALTER TABLE "eventos" ADD CONSTRAINT "eventos_evento_usuario_admin_id_publico_fkey" FOREIGN KEY ("evento_usuario_admin_id_publico") REFERENCES "usuarios_administradores"("usuario_admin_id_publico") ON DELETE RESTRICT ON UPDATE CASCADE;
