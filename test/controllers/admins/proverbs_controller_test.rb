require 'test_helper'

class Admins::ProverbsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admins_proverbs_show_url
    assert_response :success
  end

end
