class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

    $masterApiKey = "APIKEY-MASTER@NoMobb.Gigih"

    def authenticate_user
        if params[:api_key] != $masterApiKey
            render json: {status: false, error: "Unauthorized"}, status: 401
        end
    end
end
