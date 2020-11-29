class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def spotify_authorization
    query_params = {
      client_id: ENV['SPOTIFY_CLIENT_ID'],
      response_type: "code",
      redirect_uri: ENV['REDIRECT_URI'],
      scope: "user-read-email user-library-read user-modify-playback-state user-modify-playback-state",
      show_dialog: true
    }

    url = "https://accounts.spotify.com/authorize/"

    redirect_to "#{url}?#{query_params.to_query}"

  end

  def logout
    @spotify_user.destroy
    render json: { notice: "successfully logged out"}, status: :ok
  end

end
