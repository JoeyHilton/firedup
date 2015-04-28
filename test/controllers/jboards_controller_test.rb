require 'test_helper'

class JboardsControllerTest < ActionController::TestCase
  def setup
    @user = users(:one)
    @other_user = users(:two)
    @third_user = users(:three)
    @jboard = jboards(:one)
    @other_jboard = jboards(:two)
    @new_params = { title: "Updated"}
    sign_in @user
  end
  

#   test "should get index" do
#     get :index
#     assert_response :success
#   end

  test "should get new" do
    get :new, user_id: @user.id
    assert_response :success
  end

  test "should get create" do
    assert_difference('Jboard.count', 1) do
      post :create, user_id: @user.id, jboard: {title: "something"}
      assert_redirected_to jboards_path
    end
  end

  test "should get update" do
    put :update, id: @jboard.id, jboard: @new_params
    assert_response :success
  end

  test "should get destroy" do
    delete :destroy, id: @jboard.id
    assert_redirected_to jboards_path
  end

  test "should get edit" do
    get :edit, id: @jboard.id
    assert_response :success
  end

 end
