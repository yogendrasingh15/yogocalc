require "application_system_test_case"

class OffersTest < ApplicationSystemTestCase
  setup do
    @offer = offers(:one)
  end

  test "visiting the index" do
    visit offers_url
    assert_selector "h1", text: "Offers"
  end

  test "should create offer" do
    visit offers_url
    click_on "New offer"

    fill_in "Description", with: @offer.description
    fill_in "Destination", with: @offer.destination
    fill_in "Discount percentage", with: @offer.discount_percentage
    fill_in "End date", with: @offer.end_date
    fill_in "Image url", with: @offer.image_url
    check "Is featured" if @offer.is_featured
    fill_in "Offer type", with: @offer.offer_type
    fill_in "Original price", with: @offer.original_price
    fill_in "Price", with: @offer.price
    fill_in "Start date", with: @offer.start_date
    fill_in "Status", with: @offer.status
    fill_in "Title", with: @offer.title
    click_on "Create Offer"

    assert_text "Offer was successfully created"
    click_on "Back"
  end

  test "should update Offer" do
    visit offer_url(@offer)
    click_on "Edit this offer", match: :first

    fill_in "Description", with: @offer.description
    fill_in "Destination", with: @offer.destination
    fill_in "Discount percentage", with: @offer.discount_percentage
    fill_in "End date", with: @offer.end_date
    fill_in "Image url", with: @offer.image_url
    check "Is featured" if @offer.is_featured
    fill_in "Offer type", with: @offer.offer_type
    fill_in "Original price", with: @offer.original_price
    fill_in "Price", with: @offer.price
    fill_in "Start date", with: @offer.start_date
    fill_in "Status", with: @offer.status
    fill_in "Title", with: @offer.title
    click_on "Update Offer"

    assert_text "Offer was successfully updated"
    click_on "Back"
  end

  test "should destroy Offer" do
    visit offer_url(@offer)
    click_on "Destroy this offer", match: :first

    assert_text "Offer was successfully destroyed"
  end
end
