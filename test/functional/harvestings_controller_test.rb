require 'test_helper'

class HarvestingsControllerTest < ActionController::TestCase
  setup do
    @harvesting = harvestings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:harvestings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create harvesting" do
    assert_difference('Harvesting.count') do
      post :create, harvesting: { harvest_id: @harvesting.harvest_id, hours: @harvesting.hours, person_id: @harvesting.person_id }
    end

    assert_redirected_to harvesting_path(assigns(:harvesting))
  end

  test "should show harvesting" do
    get :show, id: @harvesting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @harvesting
    assert_response :success
  end

  test "should update harvesting" do
    put :update, id: @harvesting, harvesting: { harvest_id: @harvesting.harvest_id, hours: @harvesting.hours, person_id: @harvesting.person_id }
    assert_redirected_to harvesting_path(assigns(:harvesting))
  end

  test "should destroy harvesting" do
    assert_difference('Harvesting.count', -1) do
      delete :destroy, id: @harvesting
    end

    assert_redirected_to harvestings_path
  end
end
