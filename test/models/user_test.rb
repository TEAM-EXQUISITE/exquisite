require "test_helper"

class UserTest < ActiveSupport::TestCase
 def setup
  @user = User.new(name:'emeka', email:'who', password:'hello')
 end

 test "is user valid" do 
  assert @user.valid?
 end
end
