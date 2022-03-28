require "application_system_test_case"

class MembershipWithdrawalsTest < ApplicationSystemTestCase
  setup do
    @membership_withdrawal = membership_withdrawals(:one)
  end

  test "visiting the index" do
    visit membership_withdrawals_url
    assert_selector "h1", text: "Membership Withdrawals"
  end

  test "creating a Membership withdrawal" do
    visit membership_withdrawals_url
    click_on "New Membership Withdrawal"

    fill_in "Admin note", with: @membership_withdrawal.admin_note
    fill_in "Content", with: @membership_withdrawal.content
    fill_in "Status", with: @membership_withdrawal.status
    fill_in "User", with: @membership_withdrawal.user_id
    click_on "Create Membership withdrawal"

    assert_text "Membership withdrawal was successfully created"
    click_on "Back"
  end

  test "updating a Membership withdrawal" do
    visit membership_withdrawals_url
    click_on "Edit", match: :first

    fill_in "Admin note", with: @membership_withdrawal.admin_note
    fill_in "Content", with: @membership_withdrawal.content
    fill_in "Status", with: @membership_withdrawal.status
    fill_in "User", with: @membership_withdrawal.user_id
    click_on "Update Membership withdrawal"

    assert_text "Membership withdrawal was successfully updated"
    click_on "Back"
  end

  test "destroying a Membership withdrawal" do
    visit membership_withdrawals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Membership withdrawal was successfully destroyed"
  end
end
