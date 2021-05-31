require "application_system_test_case"

class CardChargesTest < ApplicationSystemTestCase
  setup do
    @card_charge = card_charges(:one)
  end

  test "visiting the index" do
    visit card_charges_url
    assert_selector "h1", text: "Card Charges"
  end

  test "creating a Card charge" do
    visit card_charges_url
    click_on "New Card Charge"

    fill_in "Amount", with: @card_charge.amount
    fill_in "Customer", with: @card_charge.customer_id
    check "Paid" if @card_charge.paid
    check "Refunded" if @card_charge.refunded
    click_on "Create Card charge"

    assert_text "Card charge was successfully created"
    click_on "Back"
  end

  test "updating a Card charge" do
    visit card_charges_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @card_charge.amount
    fill_in "Customer", with: @card_charge.customer_id
    check "Paid" if @card_charge.paid
    check "Refunded" if @card_charge.refunded
    click_on "Update Card charge"

    assert_text "Card charge was successfully updated"
    click_on "Back"
  end

  test "destroying a Card charge" do
    visit card_charges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Card charge was successfully destroyed"
  end
end
