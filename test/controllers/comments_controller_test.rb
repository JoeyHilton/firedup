require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  def setup
    @user = users(:one)
    @other_user = users(:two)
    @third_user = users(:three)
    @post = posts(:one)
    @comment = comments(:one)
    @new_params = { body: "something updated"}
    sign_in @user
  end

  test "should get new" do
    get :new, post_id: @post.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment.id
    assert_redirected_to feed_path
  end

  test "should get create" do
    post :create, post_id: @post.id, comment: {body: "something", user_id: @user.id, post_id: @post.id}
    assert_redirected_to feed_path
  end

  test "should get update" do
    put :update, id: @comment.id, comment: @new_params
    assert_redirected_to feed_path
  end

  test "should get destroy" do
    delete :destroy, id: @comment.id
    assert_redirected_to feed_path
  end

end
