class Api::V1::UsersController < ApplicationController
  # assign user when we get back to page 
  before_action :set_use, only: [:show, :update, :destroy]
    def create
    @user = User.create!(signup_params)

    if @user.save
      session[:user_id] = @user.id
      render json: @user, status: :created
    else
      render json: {
        status: 500
      }
    end
  end

  def destroy 
    @user.destroy
  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def signup_params
    params.require(:user).permit(:username, :email, :password)
  end

end
