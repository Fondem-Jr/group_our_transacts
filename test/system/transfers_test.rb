require "application_system_test_case"

class TransfersTest < ApplicationSystemTestCase
  setup do
    @transfer = transfers(:one)
  end

  test "visiting the index" do
    visit transfers_url
    assert_selector "h1", text: "Transfers"
  end

  test "creating a Transfer" do
    visit transfers_url
    click_on "New Transfer"

    fill_in "Amount", with: @transfer.amount
    fill_in "Group", with: @transfer.group_id
    fill_in "Name", with: @transfer.name
    fill_in "User", with: @transfer.user_id
    click_on "Create Transfer"

    assert_text "Transfer was successfully created"
    click_on "Back"
  end

  test "updating a Transfer" do
    visit transfers_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @transfer.amount
    fill_in "Group", with: @transfer.group_id
    fill_in "Name", with: @transfer.name
    fill_in "User", with: @transfer.user_id
    click_on "Update Transfer"

    assert_text "Transfer was successfully updated"
    click_on "Back"
  end

  test "destroying a Transfer" do
    visit transfers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transfer was successfully destroyed"
  end
end
