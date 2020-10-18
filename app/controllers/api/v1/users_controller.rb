class Api::V1::UsersController < ApplicationController

    def create
    @user = User.create!(signup_params)

    if @user.valid?
      session[:user_id] = @user.id
      render json: @user, status: :created
    else
      render json: {
        status: 500
      }
    end
  end

  private

  def signup_params
    params.require(:user).permit(:name)
  end

end
