require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get token" do
    get user_token_url
    assert_response :success
  end

end
