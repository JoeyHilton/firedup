require 'test_helper'

class JobsControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    @other_user = users(:two)
    @third_user = users(:three)
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
      post :create, user_id: @user.id, job: { company: 'Test', position: 'This is a test', :user_id => 1}
    end
      assert_response :redirect
  end

  test "Educations should belong to user when created" do
    post :create, user_id: @user.id, job: { company: 'Test', position: 'This is a test', :user_id => 1}
    job = assigns(:job)
    assert_equal @user.id, job.user_id
  end

  test "Only a job creator can edit" do
    post :create, user_id: @user.id, job: { company: 'Test', position: 'This is a test', :user_id => 1}
    job = assigns(:job)
    get :edit, user_id: @user.id, id: job.id
    # This breaks because edit is redirecting using a modal
    assert_response :success
    assert_template :edit
    sign_out @user
    sign_in @other_user
    get :edit, user_id: @user.id, id: job.id
    assert_response :success
    assert_template :edit 
    sign_out @user
    sign_in @third_user
    get :edit, user_id: @user.id,id: job.id
    patch :update, user_id: @user.id, id: job.id, job: @new_params
    updated_job = assigns(:job)
    assert_not_equal updated_job.company, @new_params[:company]
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job.id, job: @new_params
    assert_response :success
  end

  test "should get update" do
    put :update, id: @job.id, job: @new_params
    assert_response :success
  end

  test "Job can not be deleted by other user" do
    post :create, user_id: @user.id, job: { company: 'Test', position: 'This is a test', :user_id => 1}
    job = assigns(:job)
    sign_out @user
    sign_in @third_user
    assert_no_difference('Job.count') do
      get :destroy, user_id: @user.id, id: job.id
    end
    assert_response :success
  end

  test "should get destroy" do
    delete :destroy, id: @job.id
    assert_response :success
  end

end
