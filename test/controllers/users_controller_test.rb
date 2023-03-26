require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup 
    @user = users(:michael) 
  end 

  test "should get new" do
    get users_path
    assert_response :success
  end

  test "Should redirect edit when not logged in" do 
    get edit_user_url(@user) 
    assert_not flash.empty? 
    assert_redirected_to new_session_url 
  end 

  test "Should redirect update when not logged in" do 
    patch user_url(@user) 
    assert_not flash.empty? 
    assert_redirected_to new_session_url 
  end
end
