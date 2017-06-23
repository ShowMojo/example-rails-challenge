require 'test_helper'

class C2chargesControllerTest < ActionController::TestCase
  setup do
    @c2charge = c2charges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:c2charges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create c2charge" do
    assert_difference('C2charge.count') do
      post :create, c2charge: { amount: @c2charge.amount, currency: @c2charge.currency, paid: @c2charge.paid, refunded: @c2charge.refunded }
    end

    assert_redirected_to c2charge_path(assigns(:c2charge))
  end

  test "should show c2charge" do
    get :show, id: @c2charge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @c2charge
    assert_response :success
  end

  test "should update c2charge" do
    patch :update, id: @c2charge, c2charge: { amount: @c2charge.amount, currency: @c2charge.currency, paid: @c2charge.paid, refunded: @c2charge.refunded }
    assert_redirected_to c2charge_path(assigns(:c2charge))
  end

  test "should destroy c2charge" do
    assert_difference('C2charge.count', -1) do
      delete :destroy, id: @c2charge
    end

    assert_redirected_to c2charges_path
  end
end
