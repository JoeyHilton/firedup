require 'test_helper'

class CertsControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    @other_user = users(:two)
    @third_user = users(:three)
    @cert = certs(:one)
    @new_params = { title: "Updated", description: "This is updated"}
    sign_in @user
  end

  test "Certs should belong to user when created" do
    post :create, user_id: @user.id, cert: { :title => 'Test', :description => 'This is a test', :user_id => @user.id}
    cert = assigns(:cert)
    assert_equal @user.id, cert.user_id
  end

  test "Only cert creator can edit" do
    post :create, user_id: @user.id, cert: { :title => 'Test', :description => 'This is a test', :start_date => "2015-04-08", :expire_date => "2015-04-08", :user_id => @user.id}
    cert = assigns(:cert)
    get :edit, user_id: @user.id, id: cert.id
    # This breaks because edit is redirecting using a modal
    assert_response :success
    assert_template :edit
    sign_out @user
    sign_in @other_user
    get :edit, user_id: @user.id, id: cert.id
    assert_response :success
    assert_template :edit 
    sign_out @user
    sign_in @third_user
    get :edit, user_id: @user.id,id: cert.id
    patch :update, user_id: @user.id, id: cert.id, cert: @new_params
    updated_cert = assigns(:cert)
    assert_not_equal updated_cert.title, @new_params[:title]
    assert_response :success
  end

  test "should create cert" do
    assert_difference('Cert.count', 1) do    
      post :create, user_id: @user.id, cert: { :title => 'Test', :description => 'This is a test', :user_id => 1}
    end
    assert_response :redirect
  end

  test "should get index" do
    get :index, user_id: @user.id
    assert_response :success
  end

  test "should get new" do
    get :new, user_id: @user.id
    assert_response :success
  end

  

  test "should get edit" do
    get :edit, id: @cert.id, cert: @new_params
    assert_response :success
  end

  test "should get update" do
    put :update, id: @cert.id, cert: @new_params
    assert_response :success
  end

  test "Cert can not be deleted by other user" do
    post :create, user_id: @user.id, cert: { :title => 'Test', :description => 'This is a test', :user_id => 1}
    cert = assigns(:cert)
    sign_out @user
    sign_in @third_user
    assert_no_difference('Cert.count') do
      get :destroy, user_id: @user.id, id: cert.id
    end
    assert_response :success
  end

  test "should get destroy" do
    delete :destroy, id: @cert.id
    assert_response :success
  end

end
