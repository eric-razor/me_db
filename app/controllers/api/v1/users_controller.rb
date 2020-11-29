class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def spotify_authorization
    byebug
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])

  end

  def logout
    @spotify_user.destroy
    render json: { notice: "successfully logged out"}, status: :ok
  end

end
