class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
     User.find_by(id: session[:user_id]).name
   end

   def require_login
     redirect_to '/signup' if session[:user_id].blank?
   end
end
