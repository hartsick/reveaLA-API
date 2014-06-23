class SpotsController < ApplicationController
  # before_action :authenticate_admin, only: [:create, :update, :destroy  ]
  before_action :authenticate_user, only: [:create, :update, :destroy]
  before_action :set_spot, except: :index

  respond_to :json

  # GET /spots/
  # show spots approved by administrator
  def index
    @spots = Spot.where(is_approved: true)
    render json: @spots
  end

  # GET /spots/1
  # show individual spot
  def show
    render json: @spot
  end

  # POST /spots
  # get closest spot
  def query
    @closest_spot = LatLonRangeQuery.new(params[:latitude], params[:longitude], 100).results.first
  end

  # GET /spots/review
  # review not yet approved spots
  def review
    raise SecurityTransgression unless current_user.can_review?(@spot)

    @spots = Spot.where(is_approved: false)
    render json: @spots
  end

  # PATCH /spots/1
  # spot update or approval
  def update
    raise SecurityTransgression unless current_user.can_update?(@spot)

    if @spot.update(spot_params)
      render :nothing, status: 204
    else
      render json: @spot.errors, status: :unprocessable_entity
    end
  end

  # POST /spots
  # spot submission
  def create
    spot = Spot.new(spot_params)
    raise SecurityTransgression unless current_user.can_create?(spot)

    spot.created_by = current_user

    if spot.save
      render json: spot, status: :created
    else
      render json: spot.errors, status: :unprocessable_entity
    end
  end

  # DELETE /spots/1
  def destroy
    raise SecurityTransgression unless current_user.can_destroy?(@spot)

    @spot.destroy
    render json: :no_content
  end

  protected
  def spot_params
    params.require(:spot).permit(:name,:type,:street,:city,:state,:zip,:is_approved)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
