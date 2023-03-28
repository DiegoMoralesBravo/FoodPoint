require "test_helper"

class ItemsPlannerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get items_planner_index_url
    assert_response :success
  end
end
