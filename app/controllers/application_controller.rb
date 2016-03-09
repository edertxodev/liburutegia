class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # Obliga a iniciar sesión para acceder a la aplicación
  before_action :authenticate_user!
  protect_from_forgery with: :exception
end
