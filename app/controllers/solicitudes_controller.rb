class SolicitudesController < ApplicationController
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
        s.update_attribute(:aceptado, true)
        redirect_to solicitudes_path, notice: "Se ha aceptado la solicitud"
    end
    
    private
        def solicitud_params
            params.require(:libro_alquiler).permit(:libro_id, :libro, :user_id, :username)
        end
end
