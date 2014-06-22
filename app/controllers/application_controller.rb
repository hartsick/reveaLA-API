class ApplicationController < ActionController::Base
  before_action :default_json

  def authenticate_user
    head :unauthorized and return unless current_user
  end

  def current_user
    @current_user ||= access_token && User.find_by_token(access_token)
  end

  def access_token
    @access_token ||= request.authorization && request.authorization.split(' ').last
  end

end