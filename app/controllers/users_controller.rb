class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
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

  def connect
    @user = User.find(params[:user])
    

    unless current_user.follows?(@user)
      @user.follow!(current_user)
      current_user.follow!(@user)
    end

    redirect_to @user
  end
end
