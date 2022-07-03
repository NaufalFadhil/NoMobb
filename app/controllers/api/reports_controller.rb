class Api::ReportsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @reports = Report.all
    if @reports 
      render json: {status: true, data: @reports}, status: 200
    else
      render json: {status: false, message: "Report not found"}, status: 404
    end
  end

  def show
    @report = Report.find_by(id: params[:id])
    if @report 
      render json: {status: true, data: @report}, status: 200
    else
      render json: {status: false, message: "Report not found"}, status: 404
    end
  end

  def create
    @report = Report.new(
      user_id: params[:user_id],
      perpetrator_fullname: params[:perpetrator_fullname],
      perpetrator_nickname: params[:perpetrator_nickname],
      perpetrator_birthday: params[:perpetrator_birthday],
      reason: params[:reason],
      proof: params[:proof],
      witness: params[:witness],
      incident_location: params[:incident_location],
      incident_date: params[:incident_date],
      status: params[:status],
      is_valid: params[:is_valid]
    )

    if @report.valid?
      begin
        @report.save
        render json: {status: true, message: "Report has been created", data: @report}, status: 201
      rescue => exception
        render json: {status: false, message: "Fail create user", error: exception}, status: 400 
      end
    else
      render json: {status: false, message: "Fail create user", error: @report.errors}, status: 400 
    end
  end

  def update
    begin
      @report = Report.find(params[:id])

      @report.update(
        user_id: params[:user_id],
        perpetrator_fullname: params[:perpetrator_fullname],
        perpetrator_nickname: params[:perpetrator_nickname],
        perpetrator_birthday: params[:perpetrator_birthday],
        reason: params[:reason],
        proof: params[:proof],
        witness: params[:witness],
        incident_location: params[:incident_location],
        incident_date: params[:incident_date],
        status: params[:status],
        is_valid: params[:is_valid]
      )

      if @report.valid?
        render json: {status: true, message: "Report has been edited", data: @report}, status: 201
      else
        render json: {status: false, message: "Fail update report", error: @report.errors}, status: 400 
      end
    rescue => exception
      render json: {status: false, message: "Fail update user", error: exception}, status: 400 
    end
  end

  def destroy
    @report = Report.find_by(id: params[:id])
    if @report
      begin
        @report.update(
          status: "CANCELED"
        )
        if @report.valid?
          render json: {status: true, message: "Report has been canceled", data: @report}, status: 200
        else
          render json: {status: false, message: "Fail update report", error: @report.errors}, status: 400 
        end
      rescue => exception
        render json: {status: false, message: "Fail delete user", error: exception}, status: 400 
      end
    else
      render json: {status: false, message: "Report not found"}, status: 404 
    end
  end

  def check
    if params[:fullname] && params[:nickname] && params[:birthday]
      @reports = Report.where(["perpetrator_fullname = ? AND perpetrator_nickname = ? AND perpetrator_birthday = ?", params[:fullname], params[:nickname], params[:birthday]])
    elsif params[:fullname] && params[:nickname] 
      @reports = Report.where(["perpetrator_fullname = ? AND perpetrator_nickname = ?", params[:fullname], params[:nickname]])
    elsif params[:fullname]
      @reports = Report.where(["perpetrator_fullname = ?", params[:fullname]])
    end

    if !@reports.empty?
      render json: {status: true, data: @reports}, status: 200
    else
      render json: {status: false, message: "Report not found"}, status: 404
    end
  end
end
