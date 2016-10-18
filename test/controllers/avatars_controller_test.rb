require 'test_helper'

class AvatarsControllerTest < ActionController::TestCase
  setup do
    @listing = listings(:one)
    @avatar = avatars(:one)
  end

  test "should get index" do
    get :index, params: { listing_id: @listing }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { listing_id: @listing }
    assert_response :success
  end

  test "should create avatar" do
    assert_difference('Avatar.count') do
      post :create, params: { listing_id: @listing, avatar: @avatar.attributes }
    end

    assert_redirected_to listing_avatar_path(@listing, Avatar.last)
  end

  test "should show avatar" do
    get :show, params: { listing_id: @listing, id: @avatar }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { listing_id: @listing, id: @avatar }
    assert_response :success
  end

  test "should update avatar" do
    put :update, params: { listing_id: @listing, id: @avatar, avatar: @avatar.attributes }
    assert_redirected_to listing_avatar_path(@listing, Avatar.last)
  end

  test "should destroy avatar" do
    assert_difference('Avatar.count', -1) do
      delete :destroy, params: { listing_id: @listing, id: @avatar }
    end

    assert_redirected_to listing_avatars_path(@listing)
  end
end
