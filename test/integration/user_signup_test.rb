require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest
  test "Valid sign up" do 
    get new_user_path 
    assert_difference "User.count", 1 do 
      post users_path, params: {
        user: {
          name:'ekene', 
          email:'ekene@example.com',
          password:'password', 
          password_confirmation:'password'
        }
      }
    end
    assert_response :redirect 
    follow_redirect!
    assert_response :success 
    assert_template 'users/show'
    end 
end
