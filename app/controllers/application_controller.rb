class ApplicationController < ActionController::API
    before_action :authorized
    # returns the current user

    def encode_token(payload)
        # generate token
        JWT.encode(payload, 's3cr3t')
    end

    def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, 's3cr3t', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

    def user
        # User.find_by(id: session[:user_id])
        if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
    end
    end

    def logged_in?
        !!user
    end

    def authorized
        render json: {message: 'Please log in'}, status: :unauthorized unless logged_in?
    end
end
