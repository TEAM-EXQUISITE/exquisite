require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup 
    @user = users(:michael) 
  end
  
  test "Update with valid credentials if logged in" do 
    sign_in_as(@user, "password")
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

  test "Unable to update if not signed in" do 
    get edit_user_url(@user) 
    assert_not flash.empty? 
  end
end
