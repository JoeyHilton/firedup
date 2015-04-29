class CommentsController < ApplicationController

before_action :authenticate_user!
before_action :set_post, except: [:edit, :update, :destroy]

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save

      respond_to do |format|
      format.html 
      format.js
      end
    else
      render :new
    end

    
    
  end

  def edit
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
      redirect_to feed_path, notice: "Nope"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to feed_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      
      respond_to do |format|
        format.js {render :layout => false}
      end
    else
      redirect_to feed_path, notice: "Nope"
    end  
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
