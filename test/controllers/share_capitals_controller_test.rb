require 'test_helper'

class ShareCapitalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @share_capital = share_capitals(:one)
  end

  test "should get index" do
    get share_capitals_url
    assert_response :success
  end

  test "should get new" do
    get new_share_capital_url
    assert_response :success
  end

  test "should create share_capital" do
    assert_difference('ShareCapital.count') do
      post share_capitals_url, params: { share_capital: { admin_note: @share_capital.admin_note, amount: @share_capital.amount, content: @share_capital.content, status: @share_capital.status, user_id: @share_capital.user_id } }
    end

    assert_redirected_to share_capital_url(ShareCapital.last)
  end

  test "should show share_capital" do
    get share_capital_url(@share_capital)
    assert_response :success
  end

  test "should get edit" do
    get edit_share_capital_url(@share_capital)
    assert_response :success
  end

  test "should update share_capital" do
    patch share_capital_url(@share_capital), params: { share_capital: { admin_note: @share_capital.admin_note, amount: @share_capital.amount, content: @share_capital.content, status: @share_capital.status, user_id: @share_capital.user_id } }
    assert_redirected_to share_capital_url(@share_capital)
  end

  test "should destroy share_capital" do
    assert_difference('ShareCapital.count', -1) do
      delete share_capital_url(@share_capital)
    end

    assert_redirected_to share_capitals_url
  end
end
