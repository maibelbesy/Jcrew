class ApplicationController < ActionController::Base
	before_action :authenticate_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionHelper

  def redirect_guests
  	redirect_to posts_path if not logged_in?
  end

  private
  def authenticate_user
  	current_user
  end
end
