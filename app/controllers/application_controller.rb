class ApplicationController < ActionController::Base
  before_filter :detect_locale, :check_logined
  protect_from_forgery

  private
  def detect_locale
    I18n.locale = request.headers['Accept-Language'].scan(/^[a-z]{2}/).first
  end

  private
  def check_logined
    if session[:user_id] then
      begin
        @user = User.find(session[:user_id])
      rescue ActiveRecord::RecordNotFound
        reset_session
      end
    end
    unless @user
      flash[:referer] = request.fullpath
      redirect_to :controller => 'login', :action => 'index'
    end
  end

end
