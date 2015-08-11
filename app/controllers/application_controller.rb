class ApplicationController < ActionController::Base
  helper_method :current_user 

def current_user 
  @current_user ||= User.find(session[:user_id]) if session[:user_id] 
end

def authorize
	unless current_user
	  redirect_to login_path
	end
end

def require_user 
  redirect_to '/login' unless current_user
end

  protect_from_forgery with: :exception
end
