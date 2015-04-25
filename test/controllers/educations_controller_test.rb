require 'test_helper'

class EducationsControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:one)
    @other_user = users(:two)
    @third_user = users(:three)
    @education = educations(:one)
    @new_params = { school: "Updated", subject: "This is updated"}
    sign_in @user
  end

  test "should get show" do
    get :show, id: @education.id
    assert_response :success
  end
  
  test "should get new" do
    get :new, user_id: @user.id
    assert_response :success
  end


  test "should get create" do
    assert_difference('Education.count', 1) do
      post :create, user_id: @user.id, education: { school: 'Test', subject: 'This is a test', :user_id => 1}
    end
      assert_response :redirect
  end

  test "Educations should belong to user when created" do
    post :create, user_id: @user.id, education: { school: 'Test', subject: 'This is a test', :user_id => 1}
    education = assigns(:education)
    assert_equal @user.id, education.user_id
  end

  test "Only an education creator can edit" do
    post :create, user_id: @user.id, education: { school: 'Test', subject: 'This is a test', :user_id => 1}
    education = assigns(:education)
    get :edit, user_id: @user.id, id: education.id
    # This breaks because edit is redirecting using a modal
    assert_response :success
    assert_template :edit
    sign_out @user
    sign_in @other_user
    get :edit, user_id: @user.id, id: education.id
    assert_response :success
    assert_template :edit 
    sign_out @user
    sign_in @third_user
    get :edit, user_id: @user.id,id: education.id
    patch :update, user_id: @user.id, id: education.id, education: @new_params
    updated_education = assigns(:education)
    assert_not_equal updated_education.school, @new_params[:school]
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @education.id, education: @new_params
    assert_response :success
  end

  test "should get update" do
    put :update, id: @education.id, education: @new_params
    assert_response :success
  end

  test "Education can not be deleted by other user" do
    post :create, user_id: @user.id, education: { school: 'Test', subject: 'This is a test', :user_id => 1}
    education = assigns(:education)
    sign_out @user
    sign_in @third_user
    assert_no_difference('Education.count') do
      get :destroy, user_id: @user.id, id: education.id
    end
    assert_response :success
  end

  test "should get destroy" do
    delete :destroy, id: @education.id
    assert_response :success
  end

end
