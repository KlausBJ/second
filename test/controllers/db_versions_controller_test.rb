require 'test_helper'

class DbVersionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get db_versions_new_url
    assert_response :success
  end

  test "should get index" do
    get db_versions_index_url
    assert_response :success
  end

  test "should get edit" do
    get db_versions_edit_url
    assert_response :success
  end

  test "should get update" do
    get db_versions_update_url
    assert_response :success
  end

  test "should get delete" do
    get db_versions_delete_url
    assert_response :success
  end

  test "should get next" do
    get db_versions_next_url
    assert_response :success
  end

  test "should get clone" do
    get db_versions_clone_url
    assert_response :success
  end

end
