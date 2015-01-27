require 'test_helper'

class JobPostControllerTest < ActionController::TestCase
  test "should get fetch" do
    get :fetch
    assert_response :success
  end

end
