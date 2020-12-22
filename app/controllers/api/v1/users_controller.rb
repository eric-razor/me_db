class Api::V1::UsersController < ApplicationController

  def create
    # create a new user
    @user = User.create!(signup_params)

    if @user.valid? 
      session[:user_id] = @user.id
      render json: @user, status: :created
    else
      render json: {
        status: @user.errors.full_messages.to_sentence
      }
    end

  end
  
  def login
    # start a session for a user logging in 
    @user = User.find_by(username: params[:username])
    byebug
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: @user, status: :ok
    else 
      render json: {
        error: "Invalid Credentials"
      }
    end
  end

  def get_user
    if logged_in?
      render json: current_user
    else
      render json: {
        error: "no one logged in"
      }
    end
  end

  def logout 
    reset_session
    flash[:message] = "Logged out."
    # add redirect
  end

  protected

  def signup_params
    params.require(:user).permit(:username, :email, :password)
  end

end
