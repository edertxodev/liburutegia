module ComentariosHelper
    def num_comentarios_usuario(id)
        Comentario.where(user_id: id).count
    end
end