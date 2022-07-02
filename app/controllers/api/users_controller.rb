class Api::UsersController < ApplicationController
  before_action :authenticate_user

  def index
    @users = User.all
    render json: {status: true, data: @users}, status: 200
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user 
      render json: {status: true, data: @user}, status: 200
    else
      render json: {status: false, message: "User not found"}, status: 404
    end
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      phone: params[:phone],
      password: params[:password],
      is_verified: params[:is_verified],
      role: params[:role]
    )

    if @user.valid?
      begin
        @user.save
        render json: {status: true, message: "User has been created", data: @user}, status: 201
      rescue => exception
        render json: {status: false, message: "Fail create user", error: exception}, status: 400 
      end
    else
      render json: {status: false, message: "Fail create user", error: @user.errors}, status: 400 
    end
  end

  def update
    begin
      @user = User.find(params[:id])

      @user.update(
        name: params[:name],
        email: params[:email],
        phone: params[:phone],
        password: params[:password],
        is_verified: params[:is_verified],
        role: params[:role]
      )

      if @user.valid?
        render json: {status: true, message: "User has been edited", data: @user}, status: 201
      else
        render json: {status: false, message: "Fail edit user", error: @user.errors}, status: 400 
      end
    rescue => exception
      render json: {status: false, message: "Fail update user", error: exception}, status: 400 
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      begin

        @user.delete
        render json: {status: true, message: "User has been deleted"}, status: 200
      rescue => exception
        render json: {status: false, message: "Fail delete user", error: exception}, status: 400 
      end
    else
      render json: {status: false, message: "User not found"}, status: 404 
    end
  end
end
