require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test "signup" do
    visit '/'

    click_link 'Sign Up'

    assert_equal '/signup', current_path

    within '#new_user' do
      fill_in 'Username', with: 'sophie'
      fill_in 'Email', with: 'sophie@example.com'
      fill_in 'Password', with: 'secret'
      fill_in 'Password confirmation', with: 'secret'
      click_button 'Sign Up'
    end

    assert_equal '/', current_path
    refute has_link?('Sign Up')
    assert has_link?('Sign Out')
  end
end
