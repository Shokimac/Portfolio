require 'test_helper'

class Admins::EpisodesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admins_episodes_show_url
    assert_response :success
  end

end
