class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :login_check
  before_action :current_user

  def current_user
    @current_user ||= find_user_from_session
  end
  helper_method :current_user

  def login_check
    redirect_to login_path if current_user.nil?
  end

  private

  def find_user_from_session
    p User.where(id: session[:user_id]).first
    User.where(id: session[:user_id]).first if session[:user_id]
  end

end
