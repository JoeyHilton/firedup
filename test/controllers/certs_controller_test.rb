require 'test_helper'

class CertsControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    @other_user = users(:two)
    @cert = certs(:one)
    @new_params = { title: "Updated", description: "This is updated"}
    sign_in @user
  end

  test "Certs should belong to profile when created/update" do
    post :create, profile_id: @profile.id, cert: { :title => 'Test', :description => 'This is a test', :user_id => 1}
    cert = assigns(:cert)
    assert_equal @profile.id, cert.profile_id
  end

  test "should get index" do
    get :index, user_id: @user.id
    assert_response :success
  end

  test "should get new" do
    get :new, user_id: @user.id
    assert_response :success
  end

  test "should create cert" do
    assert_difference('Cert.count', 1) do    
      post :create, user_id: @user.id, cert: { :title => 'Test', :description => 'This is a test', :user_id => 1}
    end
    assert_response :redirect
  end

  test "should get edit" do
    get :edit, id: @cert.id, cert: @new_params
    assert_response :success
  end

  test "should get update" do
    put :update, id: @cert.id, cert: @new_params
    assert_response :redirect
  end

  test "should get destroy" do
    delete :destroy, id: @cert.id
    assert_response :redirect
  end

end
