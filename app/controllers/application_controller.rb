# This is the big daddy of the controllers and all controllers
# inherit from it, it has some basic functionality common to all the
# controller layer
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin_user!
    false unless current_user && current_user.try(:admin?)
    reset_session
    redirect_to '/admin/login'
  end
end
