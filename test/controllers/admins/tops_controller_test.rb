require 'test_helper'

class Admins::TopsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admins_tops_top_url
    assert_response :success
  end

end
