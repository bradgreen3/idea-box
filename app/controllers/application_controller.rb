class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #helper_methods means you can access it in views
  helper_method :current_user, :logged_in?

  def current_user
    #if current_user == nil, then find user using if session has a user id
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def redirect_if_not_logged_in
    if !logged_in?
      redirect_to login_path
    end
  end

  def current_admin?
    current_user && current_user.admin?
  end
  
end
