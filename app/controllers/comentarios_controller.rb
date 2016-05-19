class ComentariosController < ApplicationController
    def create
        @libro = Libro.find(params[:libro_id])
        @comentario = @libro.comentarios.create(comentario_params)
        redirect_to libro_path(@libro)
    end
    
    def show
        @comentarios = Comentario.where(libro_id: @libro.id)
    end
    
    def destroy
        @comentario = Comentario.find(params[:id])
        @comentario.destroy
        respond_to do |format|
          format.html { redirect_to libros_url, notice: 'El libro se ha eliminado correctamente.' }
          format.json { head :no_content }
        end
    end
    
    private
        def comentario_params
          params.require(:comentario).permit(:user_id, :username, :comentario, :libro_id)
        end
end