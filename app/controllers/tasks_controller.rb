class TasksController < ApplicationController

  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @user = current_user
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
  
    if @task.save
      respond_to do |format|
        format.html { redirect_to feed_path}
        format.js 
      end
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    if current_user.id != @task.user_id
      flash[:danger] = "You are not authorized to edit this task."
      respond_to do |format|
        format.html 
        format.js 
      end
    end
  end

  def update
    @task = Task.find(params[:id])
    if current_user.id == @task.user_id
      if @task.update(task_params)
        respond_to do |format|
          format.html { redirect_to feed_path }
          format.js 
        end
      else
        render :edit
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if current_user.id == @task.user_id
      @task.destroy
      redirect_to feed_path
      else
      flash[:danger] = "You are not authorized to delete this task."
      redirect_to feed_path
    end
  end

private
  
  def task_params
      params.require(:task).permit(:user_id, :title, :due_date, :due_time, :category, :private, :notes)
  end

end

    # t.integer  "user_id"
    # t.string   "title"
    # t.date     "due_date"
    # t.time     "due_time"
    # t.string   "category"
    # t.boolean  "private"
    # t.text     "notes"
