require 'test_helper'

class LotteryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lottery_index_url
    assert_response :success
  end

  test "should get new" do
    get lottery_new_url
    assert_response :success
  end

  test "should get create" do
    get lottery_create_url
    assert_response :success
  end

  test "should get edit" do
    get lottery_edit_url
    assert_response :success
  end

  test "should get update" do
    get lottery_update_url
    assert_response :success
  end

end
