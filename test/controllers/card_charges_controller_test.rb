require 'test_helper'

class CardChargesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_charge = card_charges(:one)
  end

  test "should get index" do
    get card_charges_url
    assert_response :success
  end

  test "should get new" do
    get new_card_charge_url
    assert_response :success
  end

  test "should create card_charge" do
    assert_difference('CardCharge.count') do
      post card_charges_url, params: { card_charge: { amount: @card_charge.amount, customer_id: @card_charge.customer_id, paid: @card_charge.paid, refunded: @card_charge.refunded } }
    end

    assert_redirected_to card_charge_url(CardCharge.last)
  end

  test "should show card_charge" do
    get card_charge_url(@card_charge)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_charge_url(@card_charge)
    assert_response :success
  end

  test "should update card_charge" do
    patch card_charge_url(@card_charge), params: { card_charge: { amount: @card_charge.amount, customer_id: @card_charge.customer_id, paid: @card_charge.paid, refunded: @card_charge.refunded } }
    assert_redirected_to card_charge_url(@card_charge)
  end

  test "should destroy card_charge" do
    assert_difference('CardCharge.count', -1) do
      delete card_charge_url(@card_charge)
    end

    assert_redirected_to card_charges_url
  end
end
