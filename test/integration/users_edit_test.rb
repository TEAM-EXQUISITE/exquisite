require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup 
    @user = users(:michael) 
  end
  
  test "Update with valid credentials if logged in" do 
    tests_log_in_as(@user) 
    get edit_user_url(@user)
    name = "james"
    email = "james@example.com"
    assert_template 'users/edit' 
    patch user_path(@user), params: {
      user: {
        name: name, 
        email: email, 
        password: "password", 
        password_confirmation: "password" 
      }
    }
    assert_not flash.empty? 
    follow_redirect! 
    assert_template 'users/show'
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end 

  test "Unsuccessful edit if not logged in" do 
    name = ""
    get edit_user_path(@user), params: {
      user:{
        name: name, 
        email: "you@example.com",
        password: password,
        password_confirmation: password
      }
    }
    assert_template 'users/edit'
    @user.reload 
    assert_not_equal name, @user.name
  end
end
