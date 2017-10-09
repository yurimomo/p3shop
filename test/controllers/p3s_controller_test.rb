require 'test_helper'

class P3sControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
