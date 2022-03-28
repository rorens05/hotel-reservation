require "application_system_test_case"

class ShareCapitalWithdrawalsTest < ApplicationSystemTestCase
  setup do
    @share_capital_withdrawal = share_capital_withdrawals(:one)
  end

  test "visiting the index" do
    visit share_capital_withdrawals_url
    assert_selector "h1", text: "Share Capital Withdrawals"
  end

  test "creating a Share capital withdrawal" do
    visit share_capital_withdrawals_url
    click_on "New Share Capital Withdrawal"

    fill_in "Admin note", with: @share_capital_withdrawal.admin_note
    fill_in "Amount", with: @share_capital_withdrawal.amount
    fill_in "Content", with: @share_capital_withdrawal.content
    fill_in "Status", with: @share_capital_withdrawal.status
    fill_in "User", with: @share_capital_withdrawal.user_id
    click_on "Create Share capital withdrawal"

    assert_text "Share capital withdrawal was successfully created"
    click_on "Back"
  end

  test "updating a Share capital withdrawal" do
    visit share_capital_withdrawals_url
    click_on "Edit", match: :first

    fill_in "Admin note", with: @share_capital_withdrawal.admin_note
    fill_in "Amount", with: @share_capital_withdrawal.amount
    fill_in "Content", with: @share_capital_withdrawal.content
    fill_in "Status", with: @share_capital_withdrawal.status
    fill_in "User", with: @share_capital_withdrawal.user_id
    click_on "Update Share capital withdrawal"

    assert_text "Share capital withdrawal was successfully updated"
    click_on "Back"
  end

  test "destroying a Share capital withdrawal" do
    visit share_capital_withdrawals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Share capital withdrawal was successfully destroyed"
  end
end
