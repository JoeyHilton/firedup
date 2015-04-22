class MessagesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @received_messages = @user.received_messages.where(archived: false)
    @sent_messages = @user.sent_messages
    @archived_messages = @user.received_messages.where(archived: true)
    # @received_messages.each do |message|
    #   message.update_attributes(viewed: true)
    # end
  end

  def show
     @user = current_user
     @message = Message.find(params[:id])
     # @received_messages.each do |message|
      @message.update_attributes(viewed: true)
  end

  def archive
    @message = Message.find(params[:id])

    @message.update_attributes(archived: true)
    redirect_to user_messages_path(current_user)

  end

  def new
    @message = Message.new
    @user = User.find(params[:user_id])
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id

    if @message.save
      redirect_to profile_path
    else
      render :new
    end
  end

  private

    def message_params
      params.require(:message).permit(:subject, :content, :user_id, :sender_id, :receiver_id, :viewed, :archived)
    end

end
