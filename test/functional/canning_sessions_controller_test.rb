require 'test_helper'

class CanningSessionsControllerTest < ActionController::TestCase
  setup do
    @canning_session = canning_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:canning_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create canning_session" do
    assert_difference('CanningSession.count') do
      post :create, canning_session: { amount_canned: @canning_session.amount_canned, date: @canning_session.date, harvest_id: @canning_session.harvest_id, leader_id: @canning_session.leader_id, notes: @canning_session.notes, pints_canned: @canning_session.pints_canned }
    end

    assert_redirected_to canning_session_path(assigns(:canning_session))
  end

  test "should show canning_session" do
    get :show, id: @canning_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @canning_session
    assert_response :success
  end

  test "should update canning_session" do
    put :update, id: @canning_session, canning_session: { amount_canned: @canning_session.amount_canned, date: @canning_session.date, harvest_id: @canning_session.harvest_id, leader_id: @canning_session.leader_id, notes: @canning_session.notes, pints_canned: @canning_session.pints_canned }
    assert_redirected_to canning_session_path(assigns(:canning_session))
  end

  test "should destroy canning_session" do
    assert_difference('CanningSession.count', -1) do
      delete :destroy, id: @canning_session
    end

    assert_redirected_to canning_sessions_path
  end
end
