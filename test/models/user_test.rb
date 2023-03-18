require "test_helper"

class UserTest < ActiveSupport::TestCase
 def setup
  @user = User.new(name:'emeka', email:'who', password:'hellos',password_confirmation:'hellos')
 end

 test "is user valid" do 
  assert @user.valid?
 end
 
 test "Password must be provided" do 
  @user.password = @user.password_confirmation = ''
  assert @user.invalid? 
 end

 test "Password must be of minimum length" do 
  @user.password = @user.password_confirmation = 'a' * 6 
  assert @user.valid?
 end 

 test "Email must be provided" do 
  @user.email = "" 
  assert_not @user.valid?
 end 

 test "Email must be unique" do 
  @user = User.new(name:'james', email:'who', password:'password',password_confirmation:'password')
  assert @user.save 
  assert user = User.new(name:'james', email:'who', password:'password',password_confirmation:'password')
  assert user.invalid?
 end  
end
