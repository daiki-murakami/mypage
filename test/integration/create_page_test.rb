require 'helpers/test_helper'

class CreatePageTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test)
  end

  test "invalid page" do
    get login_path
    post login_path, params: { session: { name:    @user.name,
      password: 'password' } }
    assert is_logged_in?
    get new_page_path
    assert_no_difference 'Page.count' do
      post pages_path, params: { page: { title:  "",
                                         tag: "その他",
                                         content: "" 
                                        } }
    end
    assert_template 'pages/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert-danger'
  end

  test "valid page" do
    get login_path
    post login_path, params: { session: { name:    @user.name,
      password: 'password' } }
    assert is_logged_in?
    get new_page_path
    assert_difference 'Page.count' do
      post pages_path, params: { page: { title:  "test",
                                         tag: "その他",
                                         content: "test" 
                                        } }
    end
    follow_redirect!
    assert_template 'pages/show'
  end

  test "valid page without login" do
    assert_no_difference 'Page.count' do
      post pages_path, params: { page: { title:  "test",
                                         tag: "その他",
                                         content: "test" 
                                        } }
    end
    assert_redirected_to root_path
  end
end
