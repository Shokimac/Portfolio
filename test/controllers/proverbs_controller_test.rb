require 'test_helper'

class ProverbsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get proverbs_new_url
    assert_response :success
  end

  test "should get show" do
    get proverbs_show_url
    assert_response :success
  end

  test "should get edit" do
    get proverbs_edit_url
    assert_response :success
  end

  test "should get index" do
    get proverbs_index_url
    assert_response :success
  end

end
