require "test_helper"

class OffersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @offer = offers(:one)
  end

  test "should get index" do
    get offers_url
    assert_response :success
  end

  test "should get new" do
    get new_offer_url
    assert_response :success
  end

  test "should create offer" do
    assert_difference("Offer.count") do
      post offers_url, params: { offer: { description: @offer.description, destination: @offer.destination, discount_percentage: @offer.discount_percentage, end_date: @offer.end_date, image_url: @offer.image_url, is_featured: @offer.is_featured, offer_type: @offer.offer_type, original_price: @offer.original_price, price: @offer.price, start_date: @offer.start_date, status: @offer.status, title: @offer.title } }
    end

    assert_redirected_to offer_url(Offer.last)
  end

  test "should show offer" do
    get offer_url(@offer)
    assert_response :success
  end

  test "should get edit" do
    get edit_offer_url(@offer)
    assert_response :success
  end

  test "should update offer" do
    patch offer_url(@offer), params: { offer: { description: @offer.description, destination: @offer.destination, discount_percentage: @offer.discount_percentage, end_date: @offer.end_date, image_url: @offer.image_url, is_featured: @offer.is_featured, offer_type: @offer.offer_type, original_price: @offer.original_price, price: @offer.price, start_date: @offer.start_date, status: @offer.status, title: @offer.title } }
    assert_redirected_to offer_url(@offer)
  end

  test "should destroy offer" do
    assert_difference("Offer.count", -1) do
      delete offer_url(@offer)
    end

    assert_redirected_to offers_url
  end
end
