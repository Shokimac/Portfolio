require 'test_helper'

class Admins::DroppedLettersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_dropped_letters_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_dropped_letters_edit_url
    assert_response :success
  end

end
