require 'test_helper'

class WelcomesControllerTest < ActionController::TestCase
  def setup
  end
  
  test "welcome index" do
    get :show
    assert_response :success
  end
end
