class EducationsController < ApplicationController

before_action :set_education, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @educations = Education.all
  end

  def new
    @education = Education.new
  end

  def create
    @education = Education.new(education_params)
  
    if @education.save
      redirect_to educations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @education.update(education_params)
    redirect_to educations_path
    else
      render :edit
    end
  end

  def destroy
    @education.destroy
    redirect_to educations_path
  end

  private
  
    def project_params
        params.require(:education).permit(:edu_school, :edu_subject, :edu_degree, :edu_description, :edu_startdate, :edu_enddate)
    end

    def set_education
      @education = Education.find(params[:id])
    end
end


 # create_table "educations", force: :cascade do |t|
 #    t.string   "edu_school"
 #    t.date     "edu_startdate"
 #    t.date     "edu_enddate"
 #    t.string   "edu_subject"
 #    t.text     "edu_description"
 #    t.string   "edu_degree"
 #    t.datetime "created_at",      null: false
 #    t.datetime "updated_at",      null: false
 #  end