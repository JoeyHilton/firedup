class MsearchesController < ApplicationController

  def new
    @msearch = Msearch.new
    @first_name = User.uniq.pluck(:first_name)
    @last_name = User.uniq.pluck(:last_name)
    @state = User.uniq.pluck(:state)
    @cities = User.uniq.pluck(:city)
  end

  def create
    @msearch = Msearch.create(msearch_params)
    redirect_to @msearch
  end

  def show
    @users = User.all

    @msearch = Msearch.find(params[:id])
    @first_name = User.uniq.pluck(:first_name)
    @last_name = User.uniq.pluck(:last_name)
    @states = User.uniq.pluck(:state)
    @cities = User.uniq.pluck(:city)
  end

  def update
    @msearch = Msearch.new
  end
   
private 

  def msearch_params
     params.require(:msearch).permit(:first_name, :last_name, :state, :city, :agency)
  end

end
