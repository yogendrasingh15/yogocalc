require "application_system_test_case"

class CustomPagesTest < ApplicationSystemTestCase
  setup do
    @custom_page = custom_pages(:one)
  end

  test "visiting the index" do
    visit custom_pages_url
    assert_selector "h1", text: "Custom pages"
  end

  test "should create custom page" do
    visit custom_pages_url
    click_on "New custom page"

    fill_in "Title", with: "Pricing"
    fill_in "Slug", with: "pricing"
    select "Standard", from: "Page type"
    select "Draft", from: "Status"
    fill_in "Content", with: "This is the pricing page content."
    fill_in "Excerpt", with: "Pricing details for packages."
    click_on "Create Custom page"

    assert_text "Custom page was successfully created"
    click_on "Back"
  end

  test "should update Custom page" do
    visit custom_page_url(@custom_page)
    click_on "Edit", match: :first

    fill_in "Title", with: "Updated Welcome"
    fill_in "Content", with: "Updated homepage content."
    click_on "Update Custom page"

    assert_text "Custom page was successfully updated"
    click_on "Back"
  end

  test "should destroy Custom page" do
    visit custom_page_url(@custom_page)
    click_on "Destroy this custom page", match: :first

    assert_text "Custom page was successfully destroyed"
  end
end
