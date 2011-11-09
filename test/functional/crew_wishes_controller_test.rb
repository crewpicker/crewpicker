require 'test_helper'

class CrewWishesControllerTest < ActionController::TestCase
  setup do
    @crew_wish = crew_wishes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crew_wishes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crew_wish" do
    assert_difference('CrewWish.count') do
      post :create, :crew_wish => @crew_wish.attributes
    end

    assert_redirected_to crew_wish_path(assigns(:crew_wish))
  end

  test "should show crew_wish" do
    get :show, :id => @crew_wish.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @crew_wish.to_param
    assert_response :success
  end

  test "should update crew_wish" do
    put :update, :id => @crew_wish.to_param, :crew_wish => @crew_wish.attributes
    assert_redirected_to crew_wish_path(assigns(:crew_wish))
  end

  test "should destroy crew_wish" do
    assert_difference('CrewWish.count', -1) do
      delete :destroy, :id => @crew_wish.to_param
    end

    assert_redirected_to crew_wishes_path
  end
end
