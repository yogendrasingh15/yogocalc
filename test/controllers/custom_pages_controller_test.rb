require "test_helper"

class CustomPagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @custom_page = custom_pages(:one)
  end

  test "should get index" do
    get custom_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_custom_page_url
    assert_response :success
  end

  test "should create custom_page" do
    assert_difference("CustomPage.count") do
      post custom_pages_url, params: { custom_page: {
        title: "Pricing",
        slug: "pricing",
        content: "This is the pricing page content.",
        excerpt: "Simple pricing information.",
        page_type: "standard",
        template: "default",
        status: "draft",
        is_active: true,
        is_homepage: false,
        sort_order: 3,
        meta_title: "Pricing",
        meta_description: "Pricing details for Yogocalc.",
        meta_keywords: "pricing, plan, packages",
        canonical_url: "https://example.com/pricing",
        robots: "index,follow",
        created_by: 1
      } }
    end

    assert_redirected_to custom_page_url(CustomPage.last)
  end

  test "should show custom_page" do
    get custom_page_url(@custom_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_custom_page_url(@custom_page)
    assert_response :success
  end

  test "should update custom_page" do
    patch custom_page_url(@custom_page), params: { custom_page: {
      title: "Updated Welcome",
      slug: "updated-welcome",
      content: "Updated homepage content.",
      excerpt: "Updated description.",
      page_type: "landing",
      status: "published",
      is_active: true,
      is_homepage: true,
      template: "default",
      sort_order: 1,
      meta_title: "Updated Welcome",
      meta_description: "Updated page description.",
      meta_keywords: "updated, welcome, yogocalc",
      canonical_url: "https://example.com/updated-welcome",
      robots: "index,follow"
    } }
    assert_redirected_to custom_page_url(@custom_page)
  end

  test "should destroy custom_page" do
    assert_difference("CustomPage.count", -1) do
      delete custom_page_url(@custom_page)
    end

    assert_redirected_to custom_pages_url
  end
end
