class LeidosController < ApplicationController
    def index
        @leidos = Leido.all.paginate(:per_page => 10, :page => params[:page])
    end
    
    def libros_leidos_usuario
        @leidos = Leido.where(username: current_user.username).paginate(:per_page => 10, :page => params[:page])
    end
    
    def devolver_libro
        s = Solicituds.find(params[:id])
        l = Libro.find(params[:libro_id])
        # registra un nuevo Leido
        @leidos = Leido.create(leido_params)
        # Borra la solicitud
        s.destroy
        # Suma en uno el número de libros disponibles
        l.update_attribute(:disponibles, l.disponibles + 1)
        redirect_to devolver_libro_path, notice: "Se ha devuelto el libro"
    end
    
    private
        def leido_params
            params.require(:libro_leido).permit(:libro_id, :user_id, :libro, :username, :fecha_leido)
        end
end