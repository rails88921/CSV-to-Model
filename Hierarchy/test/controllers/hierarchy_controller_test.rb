require 'test_helper'

class HierarchyControllerTest < ActionController::TestCase
  test "should get run" do
    get :run
    assert_response :success
  end

end
