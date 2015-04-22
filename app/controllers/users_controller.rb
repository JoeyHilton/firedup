class UsersController < ApplicationController

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
      @user.follow!(current_user)
      current_user.follow!(@user)
    end

    redirect_to @user
  end


end
