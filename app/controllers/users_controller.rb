class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @messages = @user.messages
  end

  def profile
    if user_signed_in?
      @user = current_user
      @jobs = current_user.jobs
      @certs = current_user.certs
      @educations = current_user.educations
    else
      redirect_to root_path
    end
  end

  def connect
    @user = User.find(params[:user])
    unless current_user.follows?(@user)
      
      # if @user.followed_by?(current_user)
    @user.follow!(current_user)
     current_user.follow!(@user)
    end

    redirect_to @user
  end

  def approve
    follow_records = Follow.all
    @user = User.find(params[:user_id])
    @pending_connections = []
    pending_connections_ids = []
    following_array = []

    follow_records.each do |record|
      if record.follower_id == current_user.id && record.approved == false
      following_array << record.id
      end
    end

    following_array.each do |id|
      f = Follow.find(id)
      pending_connections_ids << f.followable
    end

    pending_connections_ids.each do |id|
      @pending_connections << User.find(id)
    end
  end
end
