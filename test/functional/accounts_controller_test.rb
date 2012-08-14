require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "new account" do
    get :new
    assert_response :success
  end
  
  test "show account" do
    get :show
    assert_response :success
  end
end
