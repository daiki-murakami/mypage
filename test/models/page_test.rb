require 'test_helper'

class PageTest < ActiveSupport::TestCase
  def setup
    @page = Page.new(title: "Example Page", tag: "others", content: "test")
  end

  test "should be valid" do
    assert @page.valid?
  end

  test "title should be present" do
    @page.title = "   "
    assert_not @page.valid?
  end

  test "tag should be present" do
    @page.tag = "   "
    assert_not @page.valid?
  end

  test "content should be present" do
    @page.content = "   "
    assert_not @page.valid?
  end

  test "name should not be too long" do
    @page.title = "a" * 51
    assert_not @page.valid?
  end

  test "email should not be too long" do
    @page.tag = "a" * 51
    assert_not @page.valid?
  end
end
