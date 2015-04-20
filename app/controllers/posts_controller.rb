class PostsController < ApplicationController

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
      redirect_to feed_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
    redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path(current_user)
  end

  def feed
    @posts = Post.page(params[:page]).per(12)
  end

  private
  
    def post_params
        params.require(:post).permit(:content, :share_with, :user_id)
    end

    def set_post
      @post = Post.find(params[:id])
    end



end
