require 'test_helper'

class FireguardsControllerTest < ActionController::TestCase
  setup do
    @fireguard = fireguards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fireguards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fireguard" do
    assert_difference('Fireguard.count') do
      post :create, :fireguard => @fireguard.attributes
    end

    assert_redirected_to fireguard_path(assigns(:fireguard))
  end

  test "should show fireguard" do
    get :show, :id => @fireguard.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fireguard.to_param
    assert_response :success
  end

  test "should update fireguard" do
    put :update, :id => @fireguard.to_param, :fireguard => @fireguard.attributes
    assert_redirected_to fireguard_path(assigns(:fireguard))
  end

  test "should destroy fireguard" do
    assert_difference('Fireguard.count', -1) do
      delete :destroy, :id => @fireguard.to_param
    end

    assert_redirected_to fireguards_path
  end
end
