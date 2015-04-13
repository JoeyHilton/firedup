class CertsController < ApplicationController

  def index
    @cert = Cert.all
  end

  def new
    @cert = Cert.new
  end

  def show
    @image = Image.find(cert_params)
  end

  def create
    @cert = Cert.new(cert_params)
    if @cert.save
      redirect_to @cert
    else
      render :back
    end
  end

  def edit
    @cert = cert.find(cert_params)
    
  end

  def update
  end

  def destroy
    @cert.destroy
    redirect_to :back, notice: "Certificate deleted"
  end

  private
    
    def cert_params
      params.require(:cert).permit(:title, :start_date, :expire_date, :description, :user_id)
    end

end

    # certs schema------------------------------
    # t.string   "cert_title"
    # t.date     "cert_startdate"
    # t.date     "cert_expiredate"
    # t.text     "cert_description"
    # t.datetime "created_at",       null: false
    # t.datetime "updated_at",       null: false
