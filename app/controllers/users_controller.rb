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
end
