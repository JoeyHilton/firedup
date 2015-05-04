class PostsController < ApplicationController

  before_action :authenticate_user!

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.page(params[:page]).per(12)
  end

  def show
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
  
    if @post.save
      respond_to do |format|
        format.html { redirect_to feed_path }
        format.js 
      end
    else
      render :new
    end
  end

  def edit
    if current_user.id != @post.user_id
      flash[:danger] = "You are not authorized to edit this post."
    end
    if current_user.id == @post.user_id
    
      respond_to do |format|
        format.html 
        format.js 
      end
    end
  end

  def update
    if current_user.id == @post.user_id
      if @post.update(post_params)
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
    if current_user.id == @post.user_id
      @post.destroy
      redirect_to feed_path
      else
      flash[:danger] = "You are not authorized to delete this project."
      redirect_to feed_path
    end
  end

  def feed
  
    @users = User.all
    @posts = Post.page(params[:page]).per(12)
    @comment = Comment.new
    @tasks = current_user.tasks
  end

  # def pictured_connection
  #   @user = User.find(params[:user_id])
  # end

  private
  
    def post_params
        params.require(:post).permit(:content, :share_with, :user_id, :image)
    end

    def set_post
      @post = Post.find(params[:id])
    end



end
