require 'test_helper'

class MemberSearchTest < ActionDispatch::IntegrationTest

# Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  def setup
    @user = users(:one)
    @other_user = users(:two)
    @third_user = users(:three)
    @msearch = msearches(:one)
    
    @user = User.create!(email: 'testy@test.com', password: "password", password_confirmation: "password")
    visit(new_user_session_path)
    within(".panel-body") do
      fill_in('Email', with: @user.email)
      fill_in('Password', with: @user.password)
      click_button 'Log in'
    end
  end

  test "search for user by first name" do
    @frodo = users(:frodo)

    visit users_path
    fill_in "First name", with: "Frodo"
    click_button "Search"
    assert_text "Frodo"
    assert_no_text "Ryan"
  end

  test "search for user by last name" do
    @frodo = users(:frodo)

    visit users_path
    fill_in "Last name", with: "Bag"
    click_button "Search"
    assert_text "Bag"
    assert_no_text "Carter"
  end

  test "search for user by city name" do
    @frodo = users(:frodo)

    visit users_path
    select "Baggend", :from => "City"
    click_button "Search"
    assert_text "Baggend"
    assert_no_text "Isengard"
  end

  test "search for user by state name" do
    @frodo = users(:frodo)

    visit users_path
    select "Shire", :from => "State"
    click_button "Search"
    assert_text "Shire"
    assert_no_text "Mordor"
  end

end
