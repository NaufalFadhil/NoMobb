class Api::UsersController < ApplicationController

  $masterApiKey = "APIKEY-MASTER@NoMobb.Gigih"

  def index
    if params[:api_key] == $masterApiKey
      @users = User.all
      render json: {status: true, data: @users}, status: 200
    else
      render json: {status: false, error: "Unauthorized"}, status: 401
    end
  end

  def show
    if params[:api_key] == $masterApiKey
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
    if params[:api_key] == $masterApiKey
      @user = User.create(
        name: params[:name],
        email: params[:email],
        phone: params[:phone],
        password: params[:password],
        is_verified: params[:is_verified],
        role: params[:role]
      )
      
      begin
        @user.save
        render json: {status: true, message: "User has been created", data: @user}, status: 201
      rescue => exception
        render json: {status: false, message: "Fail create user", error: exception}, status: 400 
      end
    else
      render json: {status: false, error: "Unauthorized"}, status: 401
    end
  end

  def update
  end

  def destroy
    if params[:api_key] == $masterApiKey
      @user = User.find_by(id: params[:id])

      begin
        @user.destroy
        render json: {status: true, message: "User has been deleted"}, status: 200
      rescue => exception
        render json: {status: false, message: "Fail delete user", error: exception}, status: 400 
      end
    else
      render json: {status: false, error: "Unauthorized"}, status: 401
    end
  end
end
