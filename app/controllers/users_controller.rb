class UsersController < ApplicationController
    
    def show
        @user = current_user
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to current_user, notice: 'El usuario se ha actualizado correctamente.' }
          else
            format.html { render :edit }
          end
        end
    end
    
    protected
        
        def user_params
            params.require(:user).permit(:avatar, :role)
        end
end