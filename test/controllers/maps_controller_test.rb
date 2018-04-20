require 'test_helper'

class MapsControllerTest < ActionDispatch::IntegrationTest
  test "should get choose" do
    get maps_choose_url
    assert_response :success
  end

  test "should get map" do
    get maps_map_url
    assert_response :success
  end

end
