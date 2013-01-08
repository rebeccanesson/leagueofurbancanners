require 'test_helper'

class PruningsControllerTest < ActionController::TestCase
  setup do
    @pruning = prunings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prunings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pruning" do
    assert_difference('Pruning.count') do
      post :create, pruning: { date: @pruning.date, fruit_tree_id: @pruning.fruit_tree_id }
    end

    assert_redirected_to pruning_path(assigns(:pruning))
  end

  test "should show pruning" do
    get :show, id: @pruning
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pruning
    assert_response :success
  end

  test "should update pruning" do
    put :update, id: @pruning, pruning: { date: @pruning.date, fruit_tree_id: @pruning.fruit_tree_id }
    assert_redirected_to pruning_path(assigns(:pruning))
  end

  test "should destroy pruning" do
    assert_difference('Pruning.count', -1) do
      delete :destroy, id: @pruning
    end

    assert_redirected_to prunings_path
  end
end
