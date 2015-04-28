require 'test_helper'

class JobSearchTest < ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  def setup
    @user = users(:one)
    @other_user = users(:two)
    @third_user = users(:three)
    @jsearch = jsearches(:two)
    
    @user = User.create!(email: 'testy@test.com', password: "password", password_confirmation: "password")
    visit(new_user_session_path)
    within(".panel-body") do
      fill_in('Email', with: @user.email)
      fill_in('Password', with: @user.password)
      click_button 'Log in'
    end
  end

  test "search for job by category" do
    @jsearch

    visit jboards_path
    select "Paramedic", :from => "Category"
    click_button "Search"
    assert_text "Paramedic"
    assert_no_text "fired"
  end

  test "search for job by state" do
    @jsearch

    visit jboards_path
    select "MyString", :from => "State"
    click_button "Search"
    assert_text "MyString"
    assert_no_text "fired"
  end

  test "search for job by city name" do
    @jsearch

    visit jboards_path
    fill_in "City", with: "MyString"
    click_button "Search"
    assert_text "MyString"
    assert_no_text "fired"
  end

  test "search for job by agency name" do
    @jsearch

    visit jboards_path
    fill_in "Agency", with: "MyString"
    click_button "Search"
    assert_text "MyString"
    assert_no_text "fired"
  end


end
