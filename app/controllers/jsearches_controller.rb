class JsearchesController < ApplicationController
  
  def new
    @jsearch = Jsearch.new
    @categories = Jboard.uniq.pluck(:category)
    @states = Jboard.uniq.pluck(:state)
    @cities = Jboard.uniq.pluck(:city)
    @agencies = Jboard.uniq.pluck(:agency)
  end

  def create
    @jsearch = Jsearch.create(search_params)
    redirect_to @search
  end

  def show
    @jsearch = Jsearch.find(params[:id])
  end
   
private 

  def search_params
     params.require(:search).permit(:keywords, :category, :state, :city, :agency)
  end

end
