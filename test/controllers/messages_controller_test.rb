# require 'test_helper'

# class MessagesControllerTest < ActionController::TestCase
#   def setup
#     @user = users(:one)
#     @other_user = users(:two)
#     @third_user = users(:three)
#     @message = messages(:one)
#     @other_message = messages(:two)
#     @new_params = { subject: "Updated", content: "This is updated"}
#     sign_in @user
#   end

#   test "should create message" do
#     assert_difference('Message.count', 1) do
#       post :create, message: { subject: "TEst", content: "This is testing", user_id: 1, sender_id: 1, receiver_id: 2} 
#     end
#     assert_redirected_to user_messages_path
#   end
# end
