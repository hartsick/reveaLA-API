class ApplicationController < ActionController::Base
  include ActionController::StrongParameters
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  
  before_action :default_json
  rescue_from Exception, :with => :rescue_action

  skip_before_filter :verify_authenticity_token
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  # For all responses in this controller, return the CORS access control headers.
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = 'http://kelseyledford.github.io/reveaLA-angular/*'
    headers['Access-Control-Allow-Methods'] = 'PATCH, DELETE, POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.

  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = 'http://kelseyledford.github.io/reveaLA-angular/*'
    headers['Access-Control-Allow-Methods'] = 'PATCH, DELETE, POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Content-Type'
    headers['Access-Control-Max-Age'] = '1728000'
  end

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

  def default_serializer_options
    {
      root: false
    }
  end

  protected

  def rescue_action(e)
    case e
    when SecurityTransgression
      head :forbidden
    end
  end

end