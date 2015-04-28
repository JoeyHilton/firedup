class MessagesController < ApplicationController

  def new
    @message = Message.new
    @user = User.find(params[:user_id])
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id

    if @message.save
      redirect_to user_messages_path
    else
      render :new
    end
  end

  def index
    @user = User.find(params[:user_id])
    @received_messages = @user.received_messages.where(archived: false)
    @sorted_received_messages = @received_messages.sort_by{|e| e.created_at}.reverse!
    @sent_messages = @user.sent_messages
    @archived_messages = @user.received_messages.where(archived: true)
    # @received_messages.each do |message|
    #   message.update_attributes(viewed: true)
    # end
  end

  def received_messages
    @user = User.find(params[:user_id])
    @received_messages = @user.received_messages.where(archived: false)
    @sorted_received_messages = @received_messages.sort_by{|e| e.created_at}.reverse!
  end

  def sent_messages
    @user = User.find(params[:user_id])
    @sent_messages = @user.sent_messages
    @sorted_sent_messages = @sent_messages.order(created_at: :desc)
  end

  def archived_messages
    @user = User.find(params[:user_id])
    @archived_messages = @user.received_messages.where(archived: true)
  end

  def show
    @user = current_user
    
    @message = Message.find(params[:id])
     # @received_messages.each do |message|
    @message.update_attributes(viewed: true)

    if @message.sender == @user
      @other_user = @message.receiver
    else
      @other_user = @message.sender
    end

    
  end

  def message_history
    @user = User.find(params[:user_id])

    @sent_messages = Message.where(receiver_id: @user, sender_id: current_user)
    @received_messages = Message.where(receiver_id: current_user, sender_id: @user)
    @history = @sent_messages + @received_messages
    @sorted_history = @history.sort_by{|e| e.created_at}.reverse!
  end

  def archive
    @message = Message.find(params[:id])

    @message.update_attributes(archived: true)
    redirect_to user_messages_path(current_user)
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to user_messages_path(current_user)
  end  

  private

    def message_params
      params.require(:message).permit(:subject, :content, :user_id, :sender_id, :receiver_id, :viewed, :archived)
    end

end