class ApplicationController < ActionController::API

    def current_user
        if decoded.present?
            user_id = decoded[0]["user_id"]
            User.find(user_id) 
        end
    end
    def auth_token
        request.headers["Authorization"].split(" ").last if request.headers["Authorization"].present?
    end
    def decoded
        JsonWebToken.decode(auth_token) if auth_token.present? 
    end
end
