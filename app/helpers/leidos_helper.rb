module LeidosHelper
    # Numero de libros leidos por el usuario (current_user)
    def num_libros_leidos_usuario
        Leido.where(user_id: current_user.id).count
    end
    
    # Numero de libros leidos por el usuario que se muestra
    def num_libros_leidos_usuario_mostrar(id)
        Leido.where(user_id: id).count
    end
end