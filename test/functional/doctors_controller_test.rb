require 'test_helper'

class DoctorsControllerTest < ActionController::TestCase
  def setup
    login_as(:active_user)
    @doctor = FactoryGirl.create(:doctor)
  end
  
  test "doctors index" do
    get :index
    assert_nil flash[:error]
    assert_response :success
  end
  
  test "show doctor" do
    get :show, :id => @doctor
    assert_response :success
  end
end
