class Api::ConsultationMessageController < ApplicationController
  before_action :authenticate_user
  
  def index
    @messages = ConsultationMessage.group(:roomchat_id).count

    if !@messages.empty?
      render json: {status: true, data: @messages}, status: 200
    else
      render json: {status: false, message: "Room not found"}, status: 404
    end
  end

  def show
    @message = ConsultationMessage.where(roomchat_id: params[:id])
    if !@message.empty?
      render json: {status: true, data: @message}, status: 200
    else
      render json: {status: false, message: "Message not found"}, status: 404
    end
  end

  def create
    @message = ConsultationMessage.new(
      roomchat_id: params[:roomchat_id],
      sender: params[:sender],
      message: params[:message],
      receiver: params[:receiver]
    )

    if @message.valid?
      begin
        @message.save
        render json: {status: true, message: "Message has been created", data: @message}, status: 201
      rescue => exception
        render json: {status: false, message: "Fail create user", error: exception}, status: 400 
      end
    else
      render json: {status: false, message: "Fail create user", error: @message.errors}, status: 400 
    end
  end

  def update
    render json: {status: false, message: "Update is not available for API Access"}, status: 401
  end

  def destroy
    @message = ConsultationMessage.find_by(id: params[:id])
    if @message
      begin 
        @message.delete
        render json: {status: true, message: "Message has been deleted", data: @message}, status: 200
      rescue => exception
        render json: {status: false, message: "Fail delete message", error: exception}, status: 400 
      end
    else
      render json: {status: false, message: "Message not found"}, status: 404 
    end
  end
end
