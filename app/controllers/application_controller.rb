class ApplicationController < ActionController::API
    before_action :authorized
    # returns the current user

    def encode_token(payload)
        # generate token
        JWT.encode(payload, 'shhh, token')
    end

    def auth_header
      # { Authorization: 'Bearer <token>' }
      # nil
      request.headers['Authorization']
    end

    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        begin
          JWT.decode(token, 's3cr3t', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end

    def session_user
      decoded_hash = decoded_token
      if decoded_hash
        puts decoded_hash.class
        user_id = decoded_hash[0]['user_id']
        @user = User.find_by(id: user_id)
        byebug
      else 
        nil
      end
    end

    def logged_in?
        !!session_user
    end

    def authorized
        render json: {message: 'Please log in'}, status: :unauthorized unless logged_in?
    end
end
