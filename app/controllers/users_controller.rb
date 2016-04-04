class UsersController < ApplicationController
    before_filter :acceso_admin, only: [:edit, :update, :destroy, :new, :index]
    
    def index
        @users = User.all.paginate(:per_page => 10, :page => params[:page])
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
            params[:user].delete("password")
            params[:user].delete("password_confirmation")
        end

        @user = User.find(params[:id])
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to users_path, notice: 'El usuario se ha actualizado correctamente.' }
          else
            format.html { render :edit }
          end
        end
    end
    
    protected
        
        def user_params
            params.require(:user).permit(:avatar, :role, :password, :username)
        end
end