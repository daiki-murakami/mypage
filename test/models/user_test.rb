require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Test", password: "password",
      password_confirmation: "password")
  end
end
