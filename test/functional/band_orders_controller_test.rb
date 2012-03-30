require 'test_helper'

class BandOrdersControllerTest < ActionController::TestCase
  setup do
    @band_order = band_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:band_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create band_order" do
    assert_difference('BandOrder.count') do
      post :create, :band_order => @band_order.attributes
    end

    assert_redirected_to band_order_path(assigns(:band_order))
  end

  test "should show band_order" do
    get :show, :id => @band_order.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @band_order.to_param
    assert_response :success
  end

  test "should update band_order" do
    put :update, :id => @band_order.to_param, :band_order => @band_order.attributes
    assert_redirected_to band_order_path(assigns(:band_order))
  end

  test "should destroy band_order" do
    assert_difference('BandOrder.count', -1) do
      delete :destroy, :id => @band_order.to_param
    end

    assert_redirected_to band_orders_path
  end
end
