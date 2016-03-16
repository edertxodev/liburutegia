class UsersController < ApplicationController
    def show
        @user = current_user
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to current_user
    end
    
    def update_password
        @user = User.find(current_user.id)
        if @user.update_with_password(user_params)
          # Sign in the user by passing validation in case their password changed
          sign_in @user, :bypass => true
          redirect_to root_path
        else
          render root_path
        end
    end
    
    private
        def user_params
            params.require(:user).permit(:username, :avatar, :nombre, :apellidos, :password, :password_confirmation, :current_password)
        end
end