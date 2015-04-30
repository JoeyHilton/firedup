require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    @other_user = users(:two)
    @third_user = users(:three)
    @task = tasks(:one)
    @other_task = tasks(:two)
    @new_params = { title: "Updated"}
    sign_in @user
  end

  test "should get index" do
    get :index, user_id: @user.id
    assert_response :success
  end

  test "should get show" do
    get :show, id: @task.id
    assert_response :success
  end

  test "should get new" do
    get :new, user_id: @user.id
    assert_response :success
  end

  test "should get create" do
    assert_difference('Task.count', 1) do
    post :create, user_id: @user.id, task: {title: "this" , due_date: Date.today, due_time: Date.today, category: "mycat", private: false, notes: "mytext" }
    end
    assert_redirected_to feed_path
  end

  test "should get edit" do
    get :edit, id: @task.id
    assert_response :success
  end

  test "should get update" do
    patch :update, id: @task.id, task: @new_params
    assert_redirected_to feed_path
  end

  test "should get destroy" do
    get :destroy, id: @task.id
    assert_redirected_to feed_path
  end

end
