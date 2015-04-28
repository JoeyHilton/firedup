class CesController < ApplicationController

  before_action :authenticate_user!

  def index
    @ces = Ce.all
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @ce = @user.ces.build
    
  end

  def show
    @ce = Ce.find(params[:id])
    @ces = Ce.all
    # @image = Image.find(cert_params)
  end

  def create
    @user = User.find(params[:user_id])
    @ce = @user.ces.build(ce_params)
    if @ce.save
      respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.js 
      end
      # redirect_to profile_path
    else
      render :new
    end
  end

  def edit
    @ce = Ce.find(params[:id])
    if current_user.id == @ce.user_id
    
      respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.js 
      end
    end
  end

  def update
    @ce = Ce.find(params[:id])
    @user = @ce.user
    if current_user.id == @ce.user_id
      if @ce.update(ce_params)
        respond_to do |format|
          format.html { redirect_to user_path(current_user) }
          format.js 
        end
      else
        render :edit
      end
    end
  end

  def destroy
    @ce = Ce.find(params[:id])
    if current_user.id == @ce.user_id
    @ce.destroy
    redirect_to user_path(current_user), notice: "Continuing Ed deleted"
  end

  end

  private
    
    def ce_params
      params.require(:ce).permit(:topic, :date, :hours, :classtype, :notes, :user_id)
    end

end

    # t.string   "topic"
    # t.date     "date"
    # t.integer  "hours"
    # t.string   "classtype"
    # t.text     "notes"
    # t.integer  "user_id"
