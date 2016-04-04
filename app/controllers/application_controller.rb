class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Obliga a iniciar sesión para acceder a la aplicación
  before_action :authenticate_user!
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to '/'
  end
  
  # Función que comprueba si el usuario es admin
  def acceso_admin
    if current_user.role != "admin"
      redirect_to '/'
      flash[:error] = "No tienes acceso a esa sección"
    end
  end
end
