require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  def setup
    login_as(:active_user)
  end
  
  test "login page" do
    get :new
    assert_response :success
  end
  
  test "login" do
    post :create, :user_session => {:email => @user.email, :password => "password"}
    assert_redirected_to root_path
    assert_equal "Login successful!", flash[:success]
  end
  
  test "logout" do
    post :create, :user_session => {:email => @user.email, :password => "password"}
    delete :destroy
    assert_redirected_to root_path
    assert_equal "Logout successful!", flash[:success]
  end
end
