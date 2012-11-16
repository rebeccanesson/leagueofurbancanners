require 'test_helper'

class StatusChecksControllerTest < ActionController::TestCase
  setup do
    @status_check = status_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:status_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create status_check" do
    assert_difference('StatusCheck.count') do
      post :create, status_check: { date: @status_check.date, fruit_tree_id: @status_check.fruit_tree_id, notes: @status_check.notes, status: @status_check.status }
    end

    assert_redirected_to status_check_path(assigns(:status_check))
  end

  test "should show status_check" do
    get :show, id: @status_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @status_check
    assert_response :success
  end

  test "should update status_check" do
    put :update, id: @status_check, status_check: { date: @status_check.date, fruit_tree_id: @status_check.fruit_tree_id, notes: @status_check.notes, status: @status_check.status }
    assert_redirected_to status_check_path(assigns(:status_check))
  end

  test "should destroy status_check" do
    assert_difference('StatusCheck.count', -1) do
      delete :destroy, id: @status_check
    end

    assert_redirected_to status_checks_path
  end
end
