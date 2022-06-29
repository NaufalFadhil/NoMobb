class Api::ReportsController < ApplicationController
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
end
