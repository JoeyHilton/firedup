class EducationsController < ApplicationController

before_action :authenticate_user!


before_action :set_user, only: [:index, :new, :create]

before_action :set_education, only: [:show, :edit, :update, :destroy]


  def show
  end

  def index
    @educations = Education.all
  end

  def new
    @education = @user.educations.build
  end

  def create
    @education = @user.educations.build(education_params)
    @education.user_id = current_user.id
  
    if @education.save
      respond_to do |format|
        format.html { redirect_to profile_path }
        format.js 
      end
      # redirect_to profile_path
    else
      render :new
    end
  end

  def edit
    if current_user.id == @education.user_id
    respond_to do |format|
        format.html 
        format.js 
      end
    end
  end

  def update
    @user = @education.user
    if current_user == @education.user
      if @education.update(education_params)
        respond_to do |format|
          format.html { redirect_to profile_path }
          format.js 
        end

    # redirect_to profile_path
      else
        render :edit
      end
    end
  end

  def destroy
    if current_user.id == @education.user_id
    @education.destroy
    redirect_to profile_path
  end
  end

  private
  
    def education_params
        params.require(:education).permit(:school, :subject, :degree, :description, :start_date, :end_date, :user_id)
    end

    def set_education
      @education = Education.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
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