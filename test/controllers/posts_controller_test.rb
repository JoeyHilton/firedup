require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    @user = users(:one)
    @other_user = users(:two)
    @third_user = users(:three)
    @post = posts(:one)
    @new_params = { content: "Updated", share_with: "everybody"}
    sign_in @user
  end

  test "should get show" do
    get :show, id: @post.id
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count', 1) do
      post :create, user_id: @user.id, post: { :content => 'Test', share_with: "everybody", 
                            :user_id => 1} 
    end
    assert_redirected_to feed_path
  end

  test "should get edit" do
    post :create, user_id: @user.id, post: { :content => 'Test', share_with: "everybody", 
                            :user_id => @user.id } 
    post = assigns(:post)
    get :edit, id: post.id
    assert_response :success
    assert_template :edit
  end

  test "should get update" do
    post :create, user_id: @user.id, post: { :content => 'Test', share_with: "everybody", 
                            :user_id => 1} 
    post = assigns(:post)
    patch :update, id: post.id, post: @new_params
    post = assigns(:post)
    assert_equal post.content, @new_params[:content]
  end

  test "should get destroy" do
    post :create, user_id: @user.id, post: { :content => 'Test', share_with: "everybody", 
                            :user_id => 1} 
    post = assigns(:post)
    assert_difference('Post.count', -1) do
      delete :destroy, id: post.id
    end
    assert_response :redirect
  end

  test "Creating a post should assign it to the current user" do
    current_user = @user
    post :create, user_id: @user.id, post: { :content => 'Test', share_with: "everybody", 
                            :user_id => 1} 
    post = assigns(:post)
    assert_equal current_user.id, post.user.id
  end

  test "post can only be edited by the creator" do
    post :create, user_id: @user.id, post: { :content => 'Test', share_with: "everybody", 
                            :user_id => @user.id } 
    post = assigns(:post)
    get :edit, id: post.id
    assert_response :success
    assert_template :edit
    sign_out @user
    sign_in @other_user
    # get :edit, id: post.id
    put :update, id: post.id, post: @new_params
    updated_post = assigns(:post)
    assert_not_equal updated_post.content, @new_params[:content]
    assert_redirected_to feed_path
  end

  test "post can not be deleted by other user" do
    post :create, user_id: @user.id, post: { :content => 'Test', share_with: "everybody", 
                            :user_id => 1} 
    post = assigns(:post)
    sign_out @user
    sign_in @other_user
    assert_no_difference('Post.count') do
      delete :destroy, id: post.id
    end
    assert_redirected_to feed_path
  end

end
