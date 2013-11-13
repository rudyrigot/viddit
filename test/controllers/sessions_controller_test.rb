require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @steven = users(:steven)
  end

  test "get :new" do
    get :new

    assert_template :new
  end

  test "post :create" do
    post :create, { email: @steven.email, password: 'secret' }

    assert_equal @steven.id, session[:user_id]
    assert_redirected_to root_url
  end

  test "post :create with invalid params" do
    post :create

    assert_nil session[:user_id]
    assert_template :new
  end

  test "delete :destroy" do
    session[:user_id] = 123
    delete :destroy
    assert_nil session[:user_id]
    assert_redirected_to root_url
  end
end
