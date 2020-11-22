class ApplicationController < ActionController::API
    before_action :authorized
    # returns the current user

    def generate_token(payload)
        # generate token
        JWT.encode(payload, ENV['JWT_TOKEN_SECRET'])
    end

    def decoded_token_and_user_id
      JWT.decode(request.headers["Authorization"], ENV['JWT_TOKEN_SECRET'])[0]["id"]
    end

    def session_user
      begin
        @session_user ||= User.find(decoded_token_and_user_id)
      rescue
        return nil
    end

    def logged_in?
        !!session_user
    end

end
