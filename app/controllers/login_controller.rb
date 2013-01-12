#coding: utf-8

class LoginController < ApplicationController
  skip_before_filter :check_logined

  # action when [login]button was clicked
  def auth
    user = User.authenticate(params[:username], params[:password])
    if user then
      session[:user_id] = user.id
      redirect_to params[:referer]
    else
      flash.now[:referer] = params[:referer]
      @error = 'ユーザ名かパスワードが誤っています。'
      render 'index'
    end
  end
  
  def logout
    reset_session
    redirect_to root_path
  end

end
