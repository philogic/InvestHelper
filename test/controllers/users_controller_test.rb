require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get my_stocks" do
    get :my_stocks
    assert_response :success
  end

end
