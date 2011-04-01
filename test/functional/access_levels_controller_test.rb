require 'test_helper'

class AccessLevelsControllerTest < ActionController::TestCase
  setup do
    @access_level = access_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:access_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create access_level" do
    assert_difference('AccessLevel.count') do
      post :create, :access_level => @access_level.attributes
    end

    assert_redirected_to access_level_path(assigns(:access_level))
  end

  test "should show access_level" do
    get :show, :id => @access_level.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @access_level.to_param
    assert_response :success
  end

  test "should update access_level" do
    put :update, :id => @access_level.to_param, :access_level => @access_level.attributes
    assert_redirected_to access_level_path(assigns(:access_level))
  end

  test "should destroy access_level" do
    assert_difference('AccessLevel.count', -1) do
      delete :destroy, :id => @access_level.to_param
    end

    assert_redirected_to access_levels_path
  end
end
