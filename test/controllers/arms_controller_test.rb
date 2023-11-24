require "test_helper"

class ArmsControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get arms_input_url
    assert_response :success
  end

  test "should get output" do
    get arms_output_url
    assert_response :success
  end
end
