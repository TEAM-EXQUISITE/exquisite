ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Returns true if a test user is logged in 
  def is_logged_in? 
    !session[:user_id].nil?
  end 

  # Creates a new session by sending params to the sessions controller 
  def sign_in_as(user, password)
    post sessions_url, params: { session: { email: user.email, password: password} }
  end
end
