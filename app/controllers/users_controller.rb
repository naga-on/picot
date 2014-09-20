class UsersController < ApplicationController
  before_action :get_user, only: [:edit, :update, :toggle]

  def list
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    render :new and return unless @user.save
    render template: "shared/reload"
  end

  def edit
  end

  def update
    render :edit and return unless @user.update(user_params)
    render template: "shared/reload"
  end

  def toggle
    @user.update(is_active: !@user.is_active)
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def get_user
    @user = User.where(id: params[:uid]).first
  end
end
