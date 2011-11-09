require 'test_helper'

class CrewApplicationsControllerTest < ActionController::TestCase
  setup do
    @crew_application = crew_applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crew_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crew_application" do
    assert_difference('CrewApplication.count') do
      post :create, :crew_application => @crew_application.attributes
    end

    assert_redirected_to crew_application_path(assigns(:crew_application))
  end

  test "should show crew_application" do
    get :show, :id => @crew_application.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @crew_application.to_param
    assert_response :success
  end

  test "should update crew_application" do
    put :update, :id => @crew_application.to_param, :crew_application => @crew_application.attributes
    assert_redirected_to crew_application_path(assigns(:crew_application))
  end

  test "should destroy crew_application" do
    assert_difference('CrewApplication.count', -1) do
      delete :destroy, :id => @crew_application.to_param
    end

    assert_redirected_to crew_applications_path
  end
end
