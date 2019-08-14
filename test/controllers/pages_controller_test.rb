require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "get new page path without login" do
    get new_page_path
    assert_redirected_to root_path
  end
  
end
