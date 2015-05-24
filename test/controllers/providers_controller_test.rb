require 'test_helper'

class ProvidersControllerTest < ActionController::TestCase
  test "should get find_a_provider" do
    get :find_a_provider
    assert_response :success
  end

end
