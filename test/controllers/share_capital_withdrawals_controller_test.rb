require 'test_helper'

class ShareCapitalWithdrawalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @share_capital_withdrawal = share_capital_withdrawals(:one)
  end

  test "should get index" do
    get share_capital_withdrawals_url
    assert_response :success
  end

  test "should get new" do
    get new_share_capital_withdrawal_url
    assert_response :success
  end

  test "should create share_capital_withdrawal" do
    assert_difference('ShareCapitalWithdrawal.count') do
      post share_capital_withdrawals_url, params: { share_capital_withdrawal: { admin_note: @share_capital_withdrawal.admin_note, amount: @share_capital_withdrawal.amount, content: @share_capital_withdrawal.content, status: @share_capital_withdrawal.status, user_id: @share_capital_withdrawal.user_id } }
    end

    assert_redirected_to share_capital_withdrawal_url(ShareCapitalWithdrawal.last)
  end

  test "should show share_capital_withdrawal" do
    get share_capital_withdrawal_url(@share_capital_withdrawal)
    assert_response :success
  end

  test "should get edit" do
    get edit_share_capital_withdrawal_url(@share_capital_withdrawal)
    assert_response :success
  end

  test "should update share_capital_withdrawal" do
    patch share_capital_withdrawal_url(@share_capital_withdrawal), params: { share_capital_withdrawal: { admin_note: @share_capital_withdrawal.admin_note, amount: @share_capital_withdrawal.amount, content: @share_capital_withdrawal.content, status: @share_capital_withdrawal.status, user_id: @share_capital_withdrawal.user_id } }
    assert_redirected_to share_capital_withdrawal_url(@share_capital_withdrawal)
  end

  test "should destroy share_capital_withdrawal" do
    assert_difference('ShareCapitalWithdrawal.count', -1) do
      delete share_capital_withdrawal_url(@share_capital_withdrawal)
    end

    assert_redirected_to share_capital_withdrawals_url
  end
end
