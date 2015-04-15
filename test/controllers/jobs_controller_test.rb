require 'test_helper'

class JobsControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    @other_user = users(:two)
    @job = jobs(:one)
    @new_params = { company: "Updated", position: "This is updated"}
    sign_in @user
  end

  test "should get show" do
    get :show, id: @job.id
    assert_response :success
  end

  test "should get new" do
    get :new, user_id: @user.id
    assert_response :success
  end

  test "should get create" do
    assert_difference('Job.count', 1) do
      post :create, user_id: @user.id, job: { company: 'Updated', position: 'This is a test', :user_id => 1}
    end
      assert_response :redirect
  end

  test "should get edit" do
    get :edit, id: @job.id, job: @new_params
    assert_response :success
  end

  test "should get update" do
    put :update, id: @job.id, job: @new_params
    assert_response :redirect
  end

  test "should get destroy" do
    delete :destroy, id: @job.id
    assert_response :redirect
  end

end
