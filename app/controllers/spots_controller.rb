class SpotsController < ApplicationController
  # before_action :authenticate_admin, only: [:create, :update, :destroy  ]
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :set_spot, only: [:show, :update, :review, :destroy]

  wrap_parameters :spot, :include => [:name, :type, :street, :city, :state, :zip, :is_approved, :latitude, :longtiude, :spot_id]

  respond_to :json

  # GET /spots
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

  # POST /closest
  # get closest spot to user from their coordinates, saves spot to user if found
  def closest
    # if spot found and user logged in, save to user
    if (params[:spot_id] && current_user)
      found_spot = Spot.find(params[:spot_id])
      current_user.spots << found_spot
      current_user.save
    end

    # get closest undiscovered spot to user
    if (params[:latitude] || params[:longitude])
      closest_spot = LatLonRangeQuery.new(params[:latitude], params[:longitude], 10000000).results.first

      if closest_spot
        render json: closest_spot, status: 200
      else
        render json: closest_spot.errors, status: :unprocessable_entity
      end
    else      
      head :bad_request
    end
  end

  # GET /spots/review
  # review not yet approved spots
  def review
    head :unauthorized unless current_user.can_review?(@spot)

    @spots = Spot.where(is_approved: false)
    render json: @spots
  end

  # PATCH /spots/1
  # spot update or approval
  def update
    head :unauthorized unless current_user.can_update?(@spot)

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

    head :unauthorized unless current_user.can_create?(spot)

    spot.created_by = current_user

    if spot.save
      render json: spot, status: :created
    else
      render json: spot.errors, status: :unprocessable_entity
    end
  end

  # DELETE /spots/1
  # spot deletion
  def destroy
    head :unauthorized unless  current_user.can_destroy?(@spot)

    @spot.destroy
    render json: :no_content
  end

  protected

  def spot_params
    params.require(:spot).permit(:name, :type, :street, :city, :state, :zip, :is_approved)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
