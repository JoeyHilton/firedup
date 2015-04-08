class EducationsController < ApplicationController
  def show
  end

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
    def project_params

    def set_education
      @education = Project.find(params[:id])
    end
end
