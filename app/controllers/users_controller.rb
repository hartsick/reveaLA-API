class UsersController < ApplicationController
  before_action :authenticate, :only => [:show, :update, :destroy]

  respond_to :json

  # delete or secure me later!
  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    # Allows the user to fill out the form and save it
    # Calls the setter for the user params that it takes in
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if current_user.update(user_params)
      render nothing: true, status: 204
    else
      render json: current_user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.destroy
    render json: :no_content
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :username, :password_digest)
  end
end