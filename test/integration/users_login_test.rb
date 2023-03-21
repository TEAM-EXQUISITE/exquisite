require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
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
end
