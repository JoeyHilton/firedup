class CertsController < ApplicationController

  before_action :set_cert, only: [:show, :edit, :update, :destroy]

  def index
    @certs = Cert.all
  end

  def new
    @cert = Cert.new
    @user = current_user
  end

  def show
    # @cert = Cert.find(params[:id])
    # @image = Image.find(cert_params)
  end

  def create
    @cert = Cert.new(cert_params)
    @cert.user_id = current_user.id
    if @cert.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
    # @cert = Cert.find(params[:id])
    
  end

  def update
    if @cert.update(cert_params)
    redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    @cert.destroy
    redirect_to profile_path, notice: "Certificate deleted"
  end

  private
    
    def cert_params
      params.require(:cert).permit(:title, :start_date, :expire_date, :description, :user_id)
    end

    def set_cert
      @cert = Cert.find(params[:id])
    end

end

    # certs schema------------------------------
    # t.string   "cert_title"
    # t.date     "cert_startdate"
    # t.date     "cert_expiredate"
    # t.text     "cert_description"
    # t.datetime "created_at",       null: false
    # t.datetime "updated_at",       null: false
