class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def show
    @messages = current_user.messages
  end

  def new
    @message = Message.new
    @user = current_user
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
      params.require(:message).permit(:subject, :content, :user_id)
    end

end
