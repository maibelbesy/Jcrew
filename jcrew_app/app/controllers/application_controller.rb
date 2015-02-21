class ApplicationController < ActionController::Base
	before_action :authenticate_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionHelper

  def redirect_non_admins
    redirect_to posts_path if not logged_in? || (logged_in? && !@current_user.is_admin)
  end

  def redirect_guests
  	redirect_to posts_path if not logged_in?
  end

  def redirect_not_published
    redirect_to posts_path if logged_in? && !@current_user.is_admin
  end

  private
  def authenticate_user
  	current_user
  end
end
