class MessagesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @received_messages = Message.where(:receiver_id => @user.id)
    @sent_messages = Message.where(:sender_id => @user.id)
  end

  def show
    @user = User.find(params[:id])
     @messages = Message.find_by(receiver_id: current_user)
       if @messages == nil
        @messages = []
      end
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
      params.require(:message).permit(:subject, :content, :user_id, :sender_id, :receiver_id)
    end

end
