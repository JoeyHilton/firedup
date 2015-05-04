require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    @other_user = users(:two)
  end

  test "should redirect home when not logged in" do
    get :index
    assert_redirected_to new_user_session_path
  end

  test "logged in user should be able to connect to others" do
    sign_in @user
    get :connect, id: @other_user.id
    other_user = assigns(:user)
    assert_equal other_user, @other_user
    assert @user.follows?(@other_user)
    assert_redirected_to @other_user
  end

  test "should show pending connections" do
    sign_in @user
    @other_user.follow!(@user)
    get :pending_connection
    # assert approved: false
    pending_connections = assigns(:pending_connections)
    assert pending_connections.include?(@other_user)
    assert_response :success
  end

  test "should approve connection" do
    sign_in @user
    get :approve_connection
    # Follower is other user
    @follower = Follower.create(follower_id: @other_user.id, followable_id: @user.id)
    # Followee is current user
    @followee = Follower.create(follower_id: @user.id, followable_id: @other_user.id)    
    @follow =
    # Make sure other user and current user ids are
    
    # in the Follow table. Pluck them out of the 
    # table. When follow is approved; update to true
    # To follow back, make sure the Follow table
    # has the other user and current user as followee
    # and followable.
    # Update the follow to equal true
    assert_redirected_to user_path   

  end

  test "should get show" do
    sign_in @user
    user = @other_user
    get :show, id: user.id
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_redirected_to new_user_session_path
    sign_in :user, @user
    get :profile
    assert_response :success
  end

end
