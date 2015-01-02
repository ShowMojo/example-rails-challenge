require 'test_helper'

class ChargesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should show 3 lists" do
    get :index
    assert_select ".charges-container ul", 3
  end

  test "should show 10 succeeded, 5 failed and any number of disputed charges" do
    get :index
    assert_select ".succeeded-charges li", 10
    assert_select ".failed-charges li", 5
    assert_select ".disputed-charges li", 5
  end

end
