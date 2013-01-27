class ApplicationController < ActionController::Base
  before_filter :detect_locale, :check_logined
  protect_from_forgery
  helper_method :signed_in?

  private
  def detect_locale
    I18n.locale = request.headers['Accept-Language'].scan(/^[a-z]{2}/).first
  end

  def signed_in?
    session[:user_id]
  end

  private
  def check_logined
    if signed_in?
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
