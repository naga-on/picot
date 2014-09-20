# -*- coding: utf-8 -*-
class LoginsController < ApplicationController
  # skip_before_action :login_check

  def login
    if session[:user_id]
      flash[:notice] = '既にログイン中です'
      render :new and return
    end
    user = User.where(name: params[:user][:name]).first
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to login_path, :notice => 'ログインしました'
    else
      flash[:alert] = 'もう一度入力してください'
      render :new and return
    end
  end

  def new
    # session[:user_id] = nil
    # @current_user = nil
  end

  def destroy
    reset_session
    @current_user = nil
    redirect_to login_path, :notice => 'ログアウトしました'
  end
end
