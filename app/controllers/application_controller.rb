class ApplicationController < ActionController::Base
  include ActionController::StrongParameters
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  
  before_action :default_json
  rescue_from Exception, :with => :rescue_action

  def authenticate_user
    head :unauthorized and return unless current_user
  end

  def current_user
    @current_user ||= access_token && User.find_by_token(access_token)
  end

  def access_token
    @access_token ||= request.authorization && request.authorization.split(' ').last
  end

  def default_json
    request.format = :json if params[:format].nil?
  end

  protected

  def rescue_action(e)
    case e
    when SecurityTransgression
      head :forbidden
    end
  end

end