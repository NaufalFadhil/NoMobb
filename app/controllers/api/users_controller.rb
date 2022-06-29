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
    if params[:api_key] == "APIKEY-MASTER@NoMobb.Gigih"
      @user = User.create(
        name: params[:name],
        email: params[:email],
        phone: params[:phone],
        password: params[:password],
        is_verified: params[:is_verified],
        role: params[:role]
      )
      if @user.save
        render json: {status: true, message: "User has been created", data: @user}, status: 201
      else
        render json: {status: false, error: "Fail create user"}, status: 400 
      end
    else
      render json: {status: false, error: "Unauthorized"}, status: 401
    end
  end

  def update
  end

  def destroy
  end
end
