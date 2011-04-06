require 'test_helper'

class AccessCardsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get show_blank" do
    get :show_blank
    assert_response :success
  end

end
