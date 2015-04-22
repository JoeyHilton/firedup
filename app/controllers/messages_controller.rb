class MessagesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @received_messages = @user.received_messages
    @sent_messages = @user.sent_messages
    @archived_messages = @user.archived_messages
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
