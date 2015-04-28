require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  def setup
    @user = users(:one)
    @other_user = users(:two)
    @third_user = users(:three)
    @message = messages(:one)
    @other_message = messages(:two)
    @new_params = { subject: "Updated", content: "This is updated"}
    sign_in @user
    @message1 = Message.create(subject: "Test1", content: "This is testings", user_id: @user.id, sender_id: @user.id, receiver_id: @other_user.id)
    @message2 = Message.create(subject: "Test2", content: "This is testingss", user_id: @other_user.id, sender_id: @other_user.id, receiver_id: @user.id)
  end

  test "should get new message" do
    get :new, user_id: @user.id
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count', 1) do
      post :create, user_id: @user.id, message: { subject: "TEst", content: "This is testing", user_id: @user.id, sender_id: @user.id, receiver_id: @other_user.id} 
    end
    assert_redirected_to user_messages_path
  end

  test "should get show message" do
     get :show, id: @message.id
     assert_response :success
   end

  test "should get index of messages" do
    get :index, user_id: @user.id
    assert_response :success
  end

  test "should test message is sent" do
    get :sent_messages, user_id: @user.id
    sent_messages = assigns(:sent_messages)
    assert sent_messages.include?(@message1)
    assert_not sent_messages.include?(@message2)
    assert_response :success
  end

  test "should test message is received" do
    get :received_messages, user_id: @user.id
    received_messages = assigns(:received_messages)
    assert received_messages.include?(@message2)
    assert_not received_messages.include?(@message1)
    assert_response :success
  end

  # test "should test message is archived" do
  #   get :archived_messages, user_id: @user.id
  #   archived_messages = assigns(:archived_messages)
  #   assert archived_messages.include?(@message2)
  #   assert_not archived_messages.include?(@message1)
  #   assert_response :success
  # end

  test "should destroy message" do
    delete :destroy, id: @message.id
    assert_redirected_to user_messages_path(@user)
  end
end
