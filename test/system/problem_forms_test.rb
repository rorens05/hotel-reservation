require "application_system_test_case"

class ProblemFormsTest < ApplicationSystemTestCase
  setup do
    @problem_form = problem_forms(:one)
  end

  test "visiting the index" do
    visit problem_forms_url
    assert_selector "h1", text: "Problem Forms"
  end

  test "creating a Problem form" do
    visit problem_forms_url
    click_on "New Problem Form"

    fill_in "Admin note", with: @problem_form.admin_note
    fill_in "Content", with: @problem_form.content
    fill_in "Date of incident", with: @problem_form.date_of_incident
    fill_in "Place", with: @problem_form.place
    fill_in "Status", with: @problem_form.status
    fill_in "User", with: @problem_form.user_id
    click_on "Create Problem form"

    assert_text "Problem form was successfully created"
    click_on "Back"
  end

  test "updating a Problem form" do
    visit problem_forms_url
    click_on "Edit", match: :first

    fill_in "Admin note", with: @problem_form.admin_note
    fill_in "Content", with: @problem_form.content
    fill_in "Date of incident", with: @problem_form.date_of_incident
    fill_in "Place", with: @problem_form.place
    fill_in "Status", with: @problem_form.status
    fill_in "User", with: @problem_form.user_id
    click_on "Update Problem form"

    assert_text "Problem form was successfully updated"
    click_on "Back"
  end

  test "destroying a Problem form" do
    visit problem_forms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Problem form was successfully destroyed"
  end
end
