require 'test_helper'

class VideosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index

    assert_not_nil assigns(:videos)
    assert_not_nil assigns(:video)
    assert_template :index
  end
end
