class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find_by(id: params[:id])
    @perpetratorDetail = PerpetratorDetail.find_by(fullname: @report.perpetrator)
  end

  def new
    @report = Report.new
    @perpetratorDetail = PerpetratorDetail.new
  end

  def create
    # item = Item.create(params.require(:item).permit(:perpetrator, :reason))

    fullname = params[:fullname]
    nickname = params[:nickname]
    birthday = params[:birthday]
    reason = params[:reason]
    proof = params[:proof]
    witness = params[:witness]
    incident_location = params[:incident_location]
    incident_date = params[:incident_date]
    status = "PENDING"
    is_valid = false
    deleted_at = nil

    @report = Report.new(
      perpetrator:fullname,
      reason:reason,
      proof: proof,
      witness:witness,
      incident_location:incident_location,
      incident_date:incident_date,
      status: status,
      is_valid: is_valid,
      deleted_at: deleted_at
    )

    @perpetratorDetail = PerpetratorDetail.new(
      fullname: fullname,
      nickname: nickname,
      birthday: birthday,
      deleted_at: deleted_at
    )

    if @report.save && @perpetratorDetail.save
        flash[:notice] = "Post successfully created"
        redirect_to("/reports/index")
    else
        render("reports/new")
    end
  end

  def edit
  end
end
