require 'test_helper'

class RaceTimeLapseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get race_time_lapse_index_url
    assert_response :success
  end

  test "should get update" do
    get race_time_lapse_update_url
    assert_response :success
  end

end
