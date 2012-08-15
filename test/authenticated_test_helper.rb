module AuthenticatedTestHelper
  
  # Sets the current user in the session from the user fixtures.
  def login_as(user)
    activate_authlogic
    @user = FactoryGirl.create(user)
    # A little over kill to just be sure that the session information is set up correctly
    UserSession.create! @user
    # puts "User " + @user.full_name + " Access level " + @user.access_level.to_s + " Active " + @user.active.to_s
    # @request.session[:user_id] = user ? (user.is_a?(User) ? user.id : ) : nil
  end

  # def authorize_as(user)
  #   user = FactoryGirl.create(user)
  #   puts user.access_level
  #   @request.env["HTTP_AUTHORIZATION"] = user ? ActionController::HttpAuthentication::Basic.encode_credentials(user.login, 'password') : nil
  # end
  
  # def assert_access_denided
  #   assert_equal flash[:error], "You do not have access to this page. Please Login to a user that does."
  #   assert_redirected_to new_session_path
  # end
  # 
  # def assert_response_success
  #    assert_nil flash[:error]
  #    assert_response :success
  # end
  
end
