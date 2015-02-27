# This is the big daddy of the controllers and all controllers
# inherit from it, it has some basic functionality common to all the
# controller layer
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session, if: proc { |c| c.request.format == 'application/json' }

  def authenticate_admin_user!
    raise SecurityError unless current_user.try(:admin?)
  end

  rescue_from SecurityError do |exception|
    reset_session
    redirect_to '/admin/login'
  end
  
  def self.example_file(resources, action, format)
    File.read("#{Rails.root}/public/docs/#{resources.join('/')}/#{action}.#{format}") rescue ''
  end
end
