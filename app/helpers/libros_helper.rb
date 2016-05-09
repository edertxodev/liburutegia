module LibrosHelper
    def libro_leido
        Leido.exists?(:user_id => current_user.id, :libro_id => @libro.id)
    end
end
