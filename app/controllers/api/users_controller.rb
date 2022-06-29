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
    if params[:api_key] == "APIKEY-MASTER@NoMobb.Gigih"
      @user = User.find_by(id: params[:id])
      if @user 
        render json: {status: true, data: @user}, status: 200
      else
        render json: {status: false, message: "User not found"}, status: 404
      end
    else
      render json: {status: false, error: "Unauthorized"}, status: 401
    end
  end

  def create
  end

  def update
  end

  def destroy
  end
end
