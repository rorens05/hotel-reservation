require 'test_helper'

class MembershipWithdrawalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @membership_withdrawal = membership_withdrawals(:one)
  end

  test "should get index" do
    get membership_withdrawals_url
    assert_response :success
  end

  test "should get new" do
    get new_membership_withdrawal_url
    assert_response :success
  end

  test "should create membership_withdrawal" do
    assert_difference('MembershipWithdrawal.count') do
      post membership_withdrawals_url, params: { membership_withdrawal: { admin_note: @membership_withdrawal.admin_note, content: @membership_withdrawal.content, status: @membership_withdrawal.status, user_id: @membership_withdrawal.user_id } }
    end

    assert_redirected_to membership_withdrawal_url(MembershipWithdrawal.last)
  end

  test "should show membership_withdrawal" do
    get membership_withdrawal_url(@membership_withdrawal)
    assert_response :success
  end

  test "should get edit" do
    get edit_membership_withdrawal_url(@membership_withdrawal)
    assert_response :success
  end

  test "should update membership_withdrawal" do
    patch membership_withdrawal_url(@membership_withdrawal), params: { membership_withdrawal: { admin_note: @membership_withdrawal.admin_note, content: @membership_withdrawal.content, status: @membership_withdrawal.status, user_id: @membership_withdrawal.user_id } }
    assert_redirected_to membership_withdrawal_url(@membership_withdrawal)
  end

  test "should destroy membership_withdrawal" do
    assert_difference('MembershipWithdrawal.count', -1) do
      delete membership_withdrawal_url(@membership_withdrawal)
    end

    assert_redirected_to membership_withdrawals_url
  end
end
