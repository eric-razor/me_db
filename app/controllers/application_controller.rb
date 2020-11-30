class ApplicationController < ActionController::API
    def authorized
    render json: {error: "Access denied: not authorized."}, status: 401 unless logged_in?
    end
end
