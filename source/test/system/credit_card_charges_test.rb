require "application_system_test_case"

class CreditCardChargesTest < ApplicationSystemTestCase
  setup do
    @credit_card_charge = credit_card_charges(:one)
  end

  test "visiting the index" do
    visit credit_card_charges_url
    assert_selector "h1", text: "Credit Card Charges"
  end

  test "creating a Credit card charge" do
    visit credit_card_charges_url
    click_on "New Credit Card Charge"

    fill_in "Amount", with: @credit_card_charge.amount
    fill_in "Currency", with: @credit_card_charge.currency
    fill_in "Customer", with: @credit_card_charge.customer_id
    fill_in "Paid", with: @credit_card_charge.paid
    fill_in "Refunded", with: @credit_card_charge.refunded
    click_on "Create Credit card charge"

    assert_text "Credit card charge was successfully created"
    click_on "Back"
  end

  test "updating a Credit card charge" do
    visit credit_card_charges_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @credit_card_charge.amount
    fill_in "Currency", with: @credit_card_charge.currency
    fill_in "Customer", with: @credit_card_charge.customer_id
    fill_in "Paid", with: @credit_card_charge.paid
    fill_in "Refunded", with: @credit_card_charge.refunded
    click_on "Update Credit card charge"

    assert_text "Credit card charge was successfully updated"
    click_on "Back"
  end

  test "destroying a Credit card charge" do
    visit credit_card_charges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Credit card charge was successfully destroyed"
  end
end
