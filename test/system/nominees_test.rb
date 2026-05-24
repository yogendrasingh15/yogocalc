require "application_system_test_case"

class NomineesTest < ApplicationSystemTestCase
  setup do
    @nominee = nominees(:one)
  end

  test "visiting the index" do
    visit nominees_url
    assert_selector "h1", text: "Nominees"
  end

  test "should create nominee" do
    visit nominees_url
    click_on "New nominee"

    click_on "Create Nominee"

    assert_text "Nominee was successfully created"
    click_on "Back"
  end

  test "should update Nominee" do
    visit nominee_url(@nominee)
    click_on "Edit this nominee", match: :first

    click_on "Update Nominee"

    assert_text "Nominee was successfully updated"
    click_on "Back"
  end

  test "should destroy Nominee" do
    visit nominee_url(@nominee)
    click_on "Destroy this nominee", match: :first

    assert_text "Nominee was successfully destroyed"
  end
end
