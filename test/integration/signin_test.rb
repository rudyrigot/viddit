require 'test_helper'

class SigninTest < ActionDispatch::IntegrationTest
  setup do
    reset_session!
    @steven = users(:steven)
  end

  test "signin" do
    visit '/'

    click_link 'Sign In'

    assert_equal '/signin', current_path

    within 'form' do
      fill_in 'Email', with: @steven.email
      fill_in 'Password', with: 'secret'
      click_button 'Sign In'
    end

    assert_equal '/', current_path
    refute has_link?('Sign In')
    assert has_link?('Sign Out')
  end

  test "signin failure" do
    visit '/signin'

    within 'form' do
      click_button 'Sign In'
    end

    assert_equal '/signin', current_path
    assert has_content? 'Wrong email/password combination'
  end

  test "signout" do
    sign_in @steven

    click_link 'Sign Out'
    assert has_link? 'Sign Up'
  end
end
