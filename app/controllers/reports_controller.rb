class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find_by(id: params[:id])
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(
      user_id: params[:id],
      perpetrator_fullname: params[:fullname],
      perpetrator_nickname: params[:nickname],
      perpetrator_birthday: params[:birthday],
      reason: params[:reason],
      proof: params[:proof],
      witness: params[:witness],
      incident_location: params[:incident_location],
      incident_date: params[:incident_date],
      status: 'PENDING',
      is_valid: false
    )

    if @report.save
        flash[:notice] = "Post successfully created"
        redirect_to("/reports/index")
    else
        render("reports/new")
    end
  end

  def edit
  end
end
