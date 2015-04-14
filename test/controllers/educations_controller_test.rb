require 'test_helper'

class EducationsControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:one)
    @other_user = users(:two)
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
      post :create, user_id: @user.id, education: { school: 'Updated', subject: 'This is a test', :user_id => 1}
    end
      assert_response :redirect
  end

  test "should get edit" do
    get :edit, id: @education.id, education: @new_params
    assert_response :success
  end

  test "should get update" do
    put :update, id: @education.id, education: @new_params
    assert_response :redirect
  end

  test "should get destroy" do
    delete :destroy, id: @education.id
    assert_response :redirect
  end

end
