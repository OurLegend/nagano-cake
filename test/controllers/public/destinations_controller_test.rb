require "test_helper"

class Public::DestinationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_destinations_index_url
    assert_response :success
  end

  test "should get create" do
    get public_destinations_create_url
    assert_response :success
  end

  test "should get edit" do
    get public_destinations_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_destinations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_destinations_destroy_url
    assert_response :success
  end
end
