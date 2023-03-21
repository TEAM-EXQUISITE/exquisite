require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup 
    @user = users(:michael) 
  end 

  test "Show flash message"  do 
    get new_session_url 
    assert_template "sessions/new" 
    post sessions_path, params: {
      session: {
        email: "who", 
        password: "password" 
      }
    }
    assert_template "sessions/new" 
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end 

  test "Login with valid information" do 
    get new_session_url
    post sessions_path, params: {
      session: {
        email: @user.email, 
        password: 'password'
      }
    }
    assert_redirected_to @user 
    follow_redirect!
    assert_template 'users/show' 
  end 
end
