require 'test_helper'

class BandsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bands_new_url
    assert_response :success
  end

end
