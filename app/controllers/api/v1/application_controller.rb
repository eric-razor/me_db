class Api::V1::ApplicationController < ActionController::API
    # before_action :set_user

    protected
  # runs on every action because of before_filter allowing user to be set on frontend
    def set_user
        @user = User.find(session[:id]) if @user.nil && session[:id]
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

end
