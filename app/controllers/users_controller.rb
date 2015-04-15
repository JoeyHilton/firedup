class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def profile

    @user = current_user
    @jobs = current_user.jobs
    @certs = current_user.certs
    @educations = current_user.educations

  end

  def connect
    @user = User.find(params[:user])
    
    ## 1. make route to this acton
    # 2. make a link_to to this action passing a parameter for the follow id
    unless current_user.follows?(@user)
      @user.follow!(current_user)
      current_user.follow!(@user)
    end

    redirect_to @user

    # 4. render a page
  end
end
