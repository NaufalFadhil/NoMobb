class Api::ReportsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @reports = Report.all
    render json: @reports, status: 200
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  def check
    if params[:fullname] && params[:nickname] && params[:birthday]
      @users = Report.where(["perpetrator_fullname = ? AND perpetrator_nickname = ? AND perpetrator_birthday = ?", params[:fullname], params[:nickname], params[:birthday]])
    elsif params[:fullname] && params[:nickname] 
      @users = Report.where(["perpetrator_fullname = ? AND perpetrator_nickname = ?", params[:fullname], params[:nickname]])
    elsif params[:fullname]
      @users = Report.where(["perpetrator_fullname = ?", params[:fullname]])
    end

    if !@users.empty?
      render json: {status: true, data: @users}, status: 200
    else
      render json: {status: false, message: "User not found"}, status: 404
    end
  end
end
