class Api::V1::UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]
  before_action :set_user, only: [:show, :update, :destroy]

    def create
    @user = User.create!(signup_params)

    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, tokent:token}
    else
      render json: {
        status: 500
      }
    end
  end

  def login 
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else 
      render json: {error: "Invalid username or password"}
    end
  end

  def auto_login
    render json: @user
  end

  def destroy 
    @user.destroy
  end

   def get_user
    if logged_in?
      render json: {user: @user, token: @token}
    else
      render json: {
        error: "No one logged in"
      }
    end
  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def signup_params
    params.require(:user).permit(:username, :email, :password)
  end

end
