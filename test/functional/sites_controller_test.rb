require 'test_helper'

class SitesControllerTest < ActionController::TestCase
  setup do
    @site = sites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site" do
    assert_difference('Site.count') do
      post :create, site: { city: @site.city, latitude: @site.latitude, longitude: @site.longitude, lurc_contact_id: @site.lurc_contact_id, note: @site.note, owner_id: @site.owner_id, secondary_owner_id: @site.secondary_owner_id, status: @site.status, street: @site.street, zipcode: @site.zipcode }
    end

    assert_redirected_to site_path(assigns(:site))
  end

  test "should show site" do
    get :show, id: @site
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @site
    assert_response :success
  end

  test "should update site" do
    put :update, id: @site, site: { city: @site.city, latitude: @site.latitude, longitude: @site.longitude, lurc_contact_id: @site.lurc_contact_id, note: @site.note, owner_id: @site.owner_id, secondary_owner_id: @site.secondary_owner_id, status: @site.status, street: @site.street, zipcode: @site.zipcode }
    assert_redirected_to site_path(assigns(:site))
  end

  test "should destroy site" do
    assert_difference('Site.count', -1) do
      delete :destroy, id: @site
    end

    assert_redirected_to sites_path
  end
end
