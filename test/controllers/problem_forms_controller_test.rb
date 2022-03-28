require 'test_helper'

class ProblemFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @problem_form = problem_forms(:one)
  end

  test "should get index" do
    get problem_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_problem_form_url
    assert_response :success
  end

  test "should create problem_form" do
    assert_difference('ProblemForm.count') do
      post problem_forms_url, params: { problem_form: { admin_note: @problem_form.admin_note, content: @problem_form.content, date_of_incident: @problem_form.date_of_incident, place: @problem_form.place, status: @problem_form.status, user_id: @problem_form.user_id } }
    end

    assert_redirected_to problem_form_url(ProblemForm.last)
  end

  test "should show problem_form" do
    get problem_form_url(@problem_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_problem_form_url(@problem_form)
    assert_response :success
  end

  test "should update problem_form" do
    patch problem_form_url(@problem_form), params: { problem_form: { admin_note: @problem_form.admin_note, content: @problem_form.content, date_of_incident: @problem_form.date_of_incident, place: @problem_form.place, status: @problem_form.status, user_id: @problem_form.user_id } }
    assert_redirected_to problem_form_url(@problem_form)
  end

  test "should destroy problem_form" do
    assert_difference('ProblemForm.count', -1) do
      delete problem_form_url(@problem_form)
    end

    assert_redirected_to problem_forms_url
  end
end
