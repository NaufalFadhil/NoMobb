class Api::AccessesController < ApplicationController
  before_action :authenticate_user

  def index
    @access = ApiAccess.all
    render json: {status: true, data: @access}, status: 200
  end

  def show
    @access = ApiAccess.find_by(id: params[:id])
    if @access 
      render json: {status: true, data: @access}, status: 200
    else
      render json: {status: false, message: "API Access not found"}, status: 404
    end
  end

  def create
    @access = ApiAccess.new(
      user_id: params[:user_id],
      token: generate_token,
      expired_date: params[:expired_date]
    )

    if @access.valid?
      begin
        @access.save
        render json: {status: true, message: "API Access has been created", data: @access}, status: 201
      rescue => exception
        render json: {status: false, message: "Fail create API Access", error: exception}, status: 400 
      end
    else
      render json: {status: false, message: "Fail create API Access", error: @access.errors}, status: 400 
    end
  end

  def update
    render json: {status: false, message: "Update is not available for API Access"}, status: 401
  end

  def destroy
    @access = ApiAccess.find_by(id: params[:id])
    if @access
      begin

        @access.delete
        render json: {status: true, message: "API Access has been deleted"}, status: 200
      rescue => exception
        render json: {status: false, message: "Fail delete API Access", error: exception}, status: 400 
      end
    else
      render json: {status: false, message: "API Access not found"}, status: 404 
    end
  end

  private

  def generate_token
    token = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless ApiAccess.exists?(token: random_token)
    end
  end
end

