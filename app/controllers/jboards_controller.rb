class JboardsController < ApplicationController
  def index
    @joboards = Jboard.where([ 'name LIKE ?', “%#{params[:search]}%” ])
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def edit
  end
end
