class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_login 
    redirect_to "/" unless session.include? :user_id
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
