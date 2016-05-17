class UsersController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_filter :acceso_admin, only: [:destroy, :new, :index]
    
    def index
        @users = User.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
    end
    
    def show
        @user = current_user
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
                format.html { redirect_to users_path, notice: 'El usuario ha sido creado correctamente.' }
            else
                format.html { render :new }
            end
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        if params[:user][:password].blank?
            params[:user].delete(:password)
            params[:user].delete(:password_confirmation)
        end
        @user = User.find(params[:id])
        respond_to do |format|
          if @user.update(user_params)
            if current_user.role == "admin"
                format.html { redirect_to users_path, notice: t('usuario_actualizado') }
            else
                format.html { redirect_to root_path, notice: t('El usuario se ha actualizado correctamente.') }
            end
          else
            format.html { render :edit }
          end
        end
    end
    
    def mostrar_usuario
        @user = User.find_by_username(params[:username])
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        respond_to do |format|
          format.html { redirect_to users_url, notice: 'El usuario se ha eliminado correctamente.' }
          format.json { head :no_content }
        end
    end
    
    private
        
        def user_params
            params.require(:user).permit(:avatar, :role, :password, :username)
        end
        
        # Orientación de las columnas
        def sort_column
          User.column_names.include?(params[:sort]) ? params[:sort] : "username"
        end
        
        def sort_direction
          %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
        end
end