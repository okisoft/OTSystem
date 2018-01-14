require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in_as(name)
    post login_path, params: { sessions: { user_id: users(name).user_id,
                                           password: "password" } }
  end

  def is_logged_in?
    !session[:user_id].nil?
  end
end
