require 'test_helper'

class MemberSearchTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @other_user = users(:two)
    @third_user = users(:three)
    @msearch = msearches(:one)
    # @new_params = { content: "Updated", share_with: "everybody"}
    sign_in @user
  end
  test "member search" do
    get users_path
    assert_template 'layouts/membersearchform'
    
  end
end
