require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get Login" do
    get :new
    assert_response :success
    assert_select "title", "Sign up | Sample App"
  end

end
