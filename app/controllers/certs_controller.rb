class CertsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  before_action :set_cert, only: [:show, :edit, :update, :destroy]

  def index
    @certs = Cert.all
  end

  def new
    @cert = @user.certs.build
    
  end

  def show
    @cert = Cert.find(params[:id])
    # @image = Image.find(cert_params)
  end

  def create
    @cert = @user.certs.build(cert_params)
    if @cert.save
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
    # @cert = Cert.find(params[:id])
    
      respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.js 
      end
  end

  def update
    if @cert.update(cert_params)
        respond_to do |format|
          format.html { redirect_to user_path(current_user) }
          format.js 
        end
    # redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    @cert.destroy
    redirect_to user_path(current_user), notice: "Certificate deleted"
  end

  private
    
    def cert_params
      params.require(:cert).permit(:title, :start_date, :expire_date, :description, :user_id, :attachment)
    end

    def set_cert
      @cert = Cert.find(params[:id])
    end

     def set_user
      @user = User.find(params[:user_id])
    end

end

    # certs schema------------------------------
    # t.string   "cert_title"
    # t.date     "cert_startdate"
    # t.date     "cert_expiredate"
    # t.text     "cert_description"
    # t.datetime "created_at",       null: false
    # t.datetime "updated_at",       null: false
