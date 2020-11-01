class ApplicationController < ActionController::API
    
    # returns the current user
    def user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!user
    end
end
