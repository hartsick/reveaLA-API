class ApplicationController < ActionController::Base
  # Prevent CSRF (cross-site request forgery) attacks by raising an exception.
  protect_from_forgery with: :exception
  include ApplicationHelper

  #If you aren't signed in, you're redirected to the login form
  def authenticate_user
    if !self.current_user
    	# Change this!
      redirect_to root_path
    end
  end

end