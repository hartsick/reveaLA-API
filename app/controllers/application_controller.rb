class ApplicationController < ActionController::Base
  # Prevent CSRF (cross-site request forgery) attacks by raising an exception.
  protect_from_forgery with: :exception
  # include ApplicationHelper

  #If you aren't signed in, you're redirected to the login form
  def authenticate_user
    if !self.current_user
    	return head :unauthorized
    end
  end

  def current_user
    @current_user ||= session[:remember_token] && User.find(session[:remember_token])
  end

end