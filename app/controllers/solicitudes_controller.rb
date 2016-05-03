class SolicitudesController < ApplicationController
    before_filter :acceso_admin, only: [:destroy, :index]
    
    def index
        @solicitudes = Solicituds.all.paginate(:per_page => 10, :page => params[:page])
    end
    
    def new
        @solicitud = Solicituds.new(solicitud_params)
        respond_to do |format|
          if @solicitud.save
            format.html { redirect_to root_path, notice: 'Has solicitado el libro correctamente' }
            format.json { render :show, status: :created, location: root_path }
          else
            format.html { render :new }
            format.json { render json: @solicitud.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def aceptar_solicitud
        s = Solicituds.find(params[:id])
        l = Libro.find(params[:libro_id])
        if l.disponibles?
            s.update_attribute(:aceptado, true)
            # Resta en uno el número de libros disponibles
            l.update_attribute(:disponibles, l.disponibles - 1)
            redirect_to solicitudes_path, notice: "Se ha aceptado la solicitud"
        else
            redirect_to solicitudes_path, notice: "No se puede aceptar la solicitud. No hay más libros disponibles hast que se devuelvan"
        end
    end
    
    def show
        @solicitudes = Solicituds.all.paginate(:per_page => 10, :page => params[:page])
    end
    
    def devolver_libro
        s = Solicituds.find(params[:id])
        l = Libro.find(params[:libro_id])
        s.destroy
        # Suma en uno el número de libros disponibles
        l.update_attribute(:disponibles, l.disponibles + 1)
        redirect_to devolver_libro_path, notice: "Se ha devuelto el libro"
    end
    
    private
        def solicitud_params
            params.require(:libro_alquiler).permit(:libro_id, :libro, :user_id, :username)
        end
end
