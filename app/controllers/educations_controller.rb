class EducationsController < ApplicationController

before_action :set_education, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @educations = Education.all
  end

  def new
    @education = Education.new
    @user = current_user
  end

  def create
    @education = Education.new(education_params)
    @education.user_id = current_user.id
  
    if @education.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @education.update(education_params)
    redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    @education.destroy
    redirect_to profile_path
  end

  private
  
    def education_params
        params.require(:education).permit(:school, :subject, :degree, :description, :start_date, :end_date, :user_id)
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