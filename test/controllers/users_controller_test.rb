require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "get :new" do
    get :new

    assert_not_nil assigns(:user)
    assert_template :new
  end

  test "post :create" do
    assert_difference 'User.count' do
      post :create, user: {
        username: 'sophie',
        email: 'sophie@example.com',
        password: 'secret',
        password_confirmation: 'secret'
      }
    end

    assert_equal User.last.id, session[:user_id]
    assert_redirected_to root_url
  end

  test "post :create with invalid params" do
    assert_no_difference 'User.count' do
      post :create, user: {
        email: nil
      }
    end

    assert_nil session[:user_id]
    assert_template :new
  end
end
