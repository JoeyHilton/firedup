class StaticController < ApplicationController

  def home
    # @user = current_user if user_signed_in?
    # @posts = Post.all
    redirect_to feed_path if user_signed_in?
  end

  def about
  end

  def tour
  end

  def contact
  end

end
