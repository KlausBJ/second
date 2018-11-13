require 'test_helper'

class AppVersionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get app_versions_new_url
    assert_response :success
  end

  test "should get index" do
    get app_versions_index_url
    assert_response :success
  end

  test "should get edit" do
    get app_versions_edit_url
    assert_response :success
  end

  test "should get update" do
    get app_versions_update_url
    assert_response :success
  end

  test "should get delete" do
    get app_versions_delete_url
    assert_response :success
  end

  test "should get next" do
    get app_versions_next_url
    assert_response :success
  end

  test "should get clone" do
    get app_versions_clone_url
    assert_response :success
  end

end
