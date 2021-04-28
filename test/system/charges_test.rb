require "application_system_test_case"

class ChargesTest < ApplicationSystemTestCase
  setup do
    @charge = charges(:one)
  end

  test "visiting the index" do
    visit charges_url
    assert_selector "h1", text: "Charges"
  end

  test "creating a Charge" do
    visit charges_url
    click_on "New Charge"

    fill_in "Amount", with: @charge.amount
    fill_in "Currency", with: @charge.currency
    fill_in "Customer", with: @charge.customer
    check "Paid" if @charge.paid
    check "Refunded" if @charge.refunded
    click_on "Create Charge"

    assert_text "Charge was successfully created"
    click_on "Back"
  end

  test "updating a Charge" do
    visit charges_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @charge.amount
    fill_in "Currency", with: @charge.currency
    fill_in "Customer", with: @charge.customer
    check "Paid" if @charge.paid
    check "Refunded" if @charge.refunded
    click_on "Update Charge"

    assert_text "Charge was successfully updated"
    click_on "Back"
  end

  test "destroying a Charge" do
    visit charges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Charge was successfully destroyed"
  end
end
