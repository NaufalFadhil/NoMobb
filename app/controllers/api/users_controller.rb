class Api::UsersController < ApplicationController
  def index
    if params[:api_key] == "APIKEY-MASTER@NoMobb.Gigih"
      @users = User.all
      render json: {status: true, data: @users}, status: 200
    else
      render json: {status: false, error: "Unauthorized"}, status: 401
    end
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
