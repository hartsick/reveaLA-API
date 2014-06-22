# This controller creates and deletes sessions
class SessionsController < ApplicationController

  def create
    # Email param contains everything that the user typed in on the form
    @user = User.find_by_email(params[:email])
    # No user in the db that matches that email, or password doesn't match the one in the db
    if @user == nil || !@user.authenticate_user(params[:session][:password])
      render json: {error: 'Email or password is invalid', status: :unauthorized}
    # If there was already a user in the db that had an email matching the one that was passed in, 
    # and if the password is correct (returns true), a new session is set up
    else
      user.token = SecureRandom.hex
      user.save!
      render json: { access_token: user.token, token_type: 'bearer'}
    end

  end

  def destroy
    # Doesn't delete the user model, but deletes the fact that they are logged in
    session.delete(:access_token)
  end

end