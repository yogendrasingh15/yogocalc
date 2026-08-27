require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @page = pages(:one)
  end

  test "should get index" do
    get pages_url
    assert_response :success
  end

  test "should get new" do
    get new_page_url
    assert_response :success
  end

  test "should create page" do
    assert_difference("Page.count") do
      post pages_url, params: { page: {
        site_id: 1,
        title: "Pricing",
        slug: "pricing",
        path: "/pricing",
        status: "draft",
        template_id: 1,
        content: "Pricing details.",
        is_homepage: false
      } }
    end

    assert_redirected_to page_url(Page.last)
  end

  test "should show page" do
    get page_url(@page)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_url(@page)
    assert_response :success
  end

  test "should update page" do
    patch page_url(@page), params: { page: {
      title: "Updated Welcome",
      slug: "updated-welcome",
      path: "/updated-welcome",
      status: "published",
      content: "Updated content.",
      is_homepage: true
    } }

    assert_redirected_to page_url(Page.find_by(slug: "updated-welcome"))
  end

  test "should destroy page" do
    assert_difference("Page.count", -1) do
      delete page_url(@page)
    end

    assert_redirected_to pages_url
  end
end
