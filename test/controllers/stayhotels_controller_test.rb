require 'test_helper'

class StayhotelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stayhotels_index_url
    assert_response :success
  end

  test "should get show" do
    get stayhotels_show_url
    assert_response :success
  end

  test "should get new" do
    get stayhotels_new_url
    assert_response :success
  end

  test "should get edit" do
    get stayhotels_edit_url
    assert_response :success
  end

end
