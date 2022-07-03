class Api::CommunityController < ApplicationController
  before_action :authenticate_user
  
  def index
    @communities = Community.all

    if !@communities.empty?
      render json: {status: true, data: @communities}, status: 200
    else
      render json: {status: false, message: "Community not found"}, status: 404
    end
  end

  def show
    @community_message = CommunityMessage.where(community_id: params[:id])
    if !@community_message.empty?
      render json: {status: true, data: @community_message}, status: 200
    else
      render json: {status: false, message: "Message not found"}, status: 404
    end
  end

  def create
    @community = Community.create(
      sender: params[:sender],
      title: params[:title],
      message_preview: params[:message]
    )

    begin
      @community.save
      @community_message = CommunityMessage.new(
        community_id: @community.id,
        sender: params[:sender],
        message: params[:message]
      )
    rescue => exception
      render json: {status: false, message: "Fail create community room", error: exception}, status: 400 
    end

    if @community_message.valid?
      begin
        @community_message.save
        render json: {status: true, message: "Community Message has been created", community: @community, community_message: @community_message}, status: 201
      rescue => exception
        render json: {status: false, message: "Fail create user", error: exception}, status: 400 
      end
    else
      render json: {status: false, message: "Fail create user", error: @community_message.errors}, status: 400 
    end
  end

  def create_message
    @community_message = CommunityMessage.new(
      community_id: params[:community_id],
      sender: params[:sender],
      message: params[:message]
    )

    if @community_message.valid?
      begin
        @community_message.save
        render json: {status: true, message: "Community Message has been created", data: @community_message}, status: 201
      rescue => exception
        render json: {status: false, message: "Fail create user", error: exception}, status: 400 
      end
    else
      render json: {status: false, message: "Fail create user", error: @community_message.errors}, status: 400 
    end
  end

  def update
    render json: {status: false, message: "Update is not available for API Access"}, status: 401
  end

  def destroy
    @community = Community.find_by(id: params[:id])
    @message = CommunityMessage.where(:community_id => params[:id]).destroy_all
    if @community = @message = 
      begin
        @community.delete
        render json: {status: true, message: "Community has been deleted"}, status: 200
      rescue => exception
        render json: {status: false, message: "Fail delete message", error: exception}, status: 400 
      end
    else
      render json: {status: false, message: "Message not found"}, status: 404 
    end
  end
end
