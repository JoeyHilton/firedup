class JboardsController < ApplicationController
  before_action :set_jboard, only: [ :show, :edit, :update, :destroy]

  def index
    @jboards = Jboard.all
    @searched = Jboard.search(params[:search])
    @jsearch = Jsearch.new

    @categories = Jboard.uniq.pluck(:category)
    @states = Jboard.uniq.pluck(:state)
    @cities = Jboard.uniq.pluck(:city)
    @agencies = Jboard.uniq.pluck(:agency)

  end

  def sorted
    @searched = Jboard.search(params[:search])

  end 


  def show
  end

  def new
    @jboard = Jboard.new
    @user = current_user
  end

  def create
    @jboard = Jboard.new(jboard_params)
    @jboard.user_id = current_user.id
  
    if @jboard.save
      redirect_to jboards_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @jboard.update(jboard_params)
    redirect_to jboard_path
    else
      render :edit
    end
  end

  def destroy
    @jboard.destroy
    redirect_to jboards_path
  end

  private
  
    def jboard_params
        params.require(:jboard).permit(:title, :position, :identifier,
                       :description, :requirements, :how_to_apply,
                       :salary, :open_date, :close_date, :agency,
                       :city, :state, :zip, :website, :first_name,
                       :last_name, :phone, :email, :job_link, :poster,
                       :user_id, :category)
    end

    def set_jboard
      @jboard = Jboard.find(params[:id])
    end
end
