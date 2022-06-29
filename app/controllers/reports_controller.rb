class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find_by(id: params[:id])
    @perpetratorDetail = PerpetratorDetail.find_by(id: @report.perpetrator_detail_id)
  end

  def new
    @report = Report.new
    @perpetratorDetail = PerpetratorDetail.new
  end

  def create
    @perpetratorDetail = PerpetratorDetail.new(
      fullname: params[:fullname],
      nickname: params[:nickname],
      birthday: params[:birthday],
      deleted_at: nil
    )

    @perpetratorDetail.save

    @report = Report.new(
      perpetrator_detail_id: @perpetratorDetail.id,
      reason: params[:reason],
      proof: params[:proof],
      witness: params[:witness],
      incident_location: params[:incident_location],
      incident_date: params[:incident_date],
      status: 'PENDING',
      is_valid: false,
      deleted_at: nil
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
