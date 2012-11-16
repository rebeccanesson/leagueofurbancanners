require 'test_helper'

class FruitTreesControllerTest < ActionController::TestCase
  setup do
    @fruit_tree = fruit_trees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fruit_trees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fruit_tree" do
    assert_difference('FruitTree.count') do
      post :create, fruit_tree: { fruit_id: @fruit_tree.fruit_id, season_end: @fruit_tree.season_end, season_start: @fruit_tree.season_start, site_id: @fruit_tree.site_id }
    end

    assert_redirected_to fruit_tree_path(assigns(:fruit_tree))
  end

  test "should show fruit_tree" do
    get :show, id: @fruit_tree
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fruit_tree
    assert_response :success
  end

  test "should update fruit_tree" do
    put :update, id: @fruit_tree, fruit_tree: { fruit_id: @fruit_tree.fruit_id, season_end: @fruit_tree.season_end, season_start: @fruit_tree.season_start, site_id: @fruit_tree.site_id }
    assert_redirected_to fruit_tree_path(assigns(:fruit_tree))
  end

  test "should destroy fruit_tree" do
    assert_difference('FruitTree.count', -1) do
      delete :destroy, id: @fruit_tree
    end

    assert_redirected_to fruit_trees_path
  end
end
