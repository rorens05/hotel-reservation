require "application_system_test_case"

class ShareCapitalsTest < ApplicationSystemTestCase
  setup do
    @share_capital = share_capitals(:one)
  end

  test "visiting the index" do
    visit share_capitals_url
    assert_selector "h1", text: "Share Capitals"
  end

  test "creating a Share capital" do
    visit share_capitals_url
    click_on "New Share Capital"

    fill_in "Admin note", with: @share_capital.admin_note
    fill_in "Amount", with: @share_capital.amount
    fill_in "Content", with: @share_capital.content
    fill_in "Status", with: @share_capital.status
    fill_in "User", with: @share_capital.user_id
    click_on "Create Share capital"

    assert_text "Share capital was successfully created"
    click_on "Back"
  end

  test "updating a Share capital" do
    visit share_capitals_url
    click_on "Edit", match: :first

    fill_in "Admin note", with: @share_capital.admin_note
    fill_in "Amount", with: @share_capital.amount
    fill_in "Content", with: @share_capital.content
    fill_in "Status", with: @share_capital.status
    fill_in "User", with: @share_capital.user_id
    click_on "Update Share capital"

    assert_text "Share capital was successfully updated"
    click_on "Back"
  end

  test "destroying a Share capital" do
    visit share_capitals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Share capital was successfully destroyed"
  end
end
