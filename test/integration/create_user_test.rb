require 'helpers/test_helper'

class CreatePageTest < ActionDispatch::IntegrationTest
  test "can not create user" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { 
        name: 'test',
        password: 'password',
        password_confirmation: 'password'
      } }
    end
    assert_template 'users/new'
  end
end
