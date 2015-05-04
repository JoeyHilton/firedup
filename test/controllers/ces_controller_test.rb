require 'test_helper'

class CesControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    @other_user = users(:two)
    @third_user = users(:three)
    @ce = ces(:one)
    @new_params = { topic: "Updated", classtype: "This is updated"}
    sign_in @user
  end

  test "should get index" do
    get :index, user_id: @user.id
    assert_response :success
  end

  test "should get show" do
    get :show, id: @ce.id
    assert_response :success
  end

  test "should get new" do
    get :new, user_id: @user.id
    assert_response :success
  end

  test "should get create" do
    assert_difference('Ce.count', 1) do
      post :create, user_id: @user.id, ce: { topic: 'Test', classtype: 'This is a test', date: Date.today, hours: 2, :user_id => 1}
    end
      assert_response :redirect
  end

  test "Ces should belong to user when created" do
    post :create, user_id: @user.id, ce: { topic: 'Test', classtype: 'This is a test', date: Date.today, hours: 2, :user_id => 1}
    ce = assigns(:ce)
    assert_equal @user.id, ce.user_id
  end

  test "should get edit" do
    get :edit, id: @ce.id, ce: @new_params
    assert_response :success
  end

  test "should get update" do
    put :update, id: @ce.id, ce: @new_params
    assert_response :success
  end

  test "ce can not be deleted by other user" do
    post :create, user_id: @user.id, ce: { topic: 'Test', classtype: 'This is a test', date: Date.today, hours: 2, :user_id => 1}
    ce = assigns(:ce)
    sign_out @user
    sign_in @third_user
    assert_no_difference('Ce.count') do
      get :destroy, user_id: @user.id, id: ce.id
    end
    assert_response :success
  end

  test "should get destroy" do
    delete :destroy, id: @ce.id
    assert_response :success
  end

end
