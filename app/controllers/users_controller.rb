class UsersController < ApplicationController


before_action :authenticate_user!

  def index
    @users = User.page(params[:page]).per(12)
    @jobs = Job.all
    

    # for member search
    @msearch = Msearch.new
    @fname = User.uniq.pluck(:first_name)
    @lname = User.uniq.pluck(:last_name)
    @state = User.uniq.pluck(:state)
    @city = User.uniq.pluck(:city)
    # end of user search
  end

  def show
    @user = User.find(params[:id])
    @messages = @user.messages

    @jobs = @user.jobs
    @educations = @user.educations
    @certs = @user.certs
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
    unless current_user.follows?(@user)
      
      # if @user.followed_by?(current_user)
      # @user.follow!(current_user)
     current_user.follow!(@user)
    end

    redirect_to @user
  end

  def disconnect
    @user = User.find(params[:id])

    if current_user.follows?(@user) && @user.follows?(current_user)
      @user.unfollow!(current_user)
      current_user.unfollow!(@user)
    end
    redirect_to user_path(@user)
  end

  def pending_connection
    # All recored where current user is being followed and approved is false
    @follow_records = Follow.where(followable_id: current_user.id, approved: false)
    # Followers from those connections
    @pending_connections = @follow_records.map do |f| 
      User.find(f.follower_id)
    end
  end

  def approve_connection
    # Find your actors
    @follower = User.find(params[:id])
    @followee = current_user
    # Approve the follow
    @follow = Follow.find_by(follower_id: @follower.id, followable_id: @followee.id)
    @follow.update(approved: true)
    # Follow back
    current_user.follow!(@follower)
    # Approve the follow back
    @followed = Follow.find_by(follower_id: @followee.id, followable_id: @follower.id)
    @followed.update(approved: true)
    # Back to pending page
    redirect_to user_path
  end

end
