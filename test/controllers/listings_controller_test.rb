require 'test_helper'

class ListingsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @listing = listings(:one)
  end

  test "should get index" do
    get :index, params: { user_id: @user }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { user_id: @user }
    assert_response :success
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post :create, params: { user_id: @user, listing: @listing.attributes }
    end

    assert_redirected_to user_listing_path(@user, Listing.last)
  end

  test "should show listing" do
    get :show, params: { user_id: @user, id: @listing }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { user_id: @user, id: @listing }
    assert_response :success
  end

  test "should update listing" do
    put :update, params: { user_id: @user, id: @listing, listing: @listing.attributes }
    assert_redirected_to user_listing_path(@user, Listing.last)
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete :destroy, params: { user_id: @user, id: @listing }
    end

    assert_redirected_to user_listings_path(@user)
  end
end
