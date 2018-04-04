require 'test_helper'

class CreditCardChargesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_card_charge = credit_card_charges(:one)
  end

  test "should get index" do
    get credit_card_charges_url
    assert_response :success
  end

  test "should get new" do
    get new_credit_card_charge_url
    assert_response :success
  end

  test "should create credit_card_charge" do
    assert_difference('CreditCardCharge.count') do
      post credit_card_charges_url, params: { credit_card_charge: {  } }
    end

    assert_redirected_to credit_card_charge_url(CreditCardCharge.last)
  end

  test "should show credit_card_charge" do
    get credit_card_charge_url(@credit_card_charge)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_card_charge_url(@credit_card_charge)
    assert_response :success
  end

  test "should update credit_card_charge" do
    patch credit_card_charge_url(@credit_card_charge), params: { credit_card_charge: {  } }
    assert_redirected_to credit_card_charge_url(@credit_card_charge)
  end

  test "should destroy credit_card_charge" do
    assert_difference('CreditCardCharge.count', -1) do
      delete credit_card_charge_url(@credit_card_charge)
    end

    assert_redirected_to credit_card_charges_url
  end
end
