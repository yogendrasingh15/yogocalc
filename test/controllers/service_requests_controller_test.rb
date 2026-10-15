require "test_helper"

class ServiceRequestsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @service_request = ServiceRequest.create!(
      request_type: "repair",
      title: "Inverter stopped reporting",
      reported_channel: "customer_portal"
    )
  end

  test "should get index" do
    get service_requests_url
    assert_response :success
  end

  test "should filter service requests in JSON" do
    get service_requests_url(format: :json), params: { q: "Inverter", status: "open" }

    assert_response :success
    assert_equal [@service_request.request_number], response.parsed_body.map { |item| item["request_number"] }
  end

  test "should get new" do
    get new_service_request_url
    assert_response :success
  end

  test "should create service request" do
    assert_difference("ServiceRequest.count") do
      post service_requests_url, params: {
        service_request: {
          request_number: "CUSTOM-NUMBER",
          request_type: "maintenance",
          title: "Annual inspection",
          reported_channel: "phone",
          priority: "high",
          severity: "medium"
        }
      }
    end

    assert_redirected_to service_request_url(ServiceRequest.order(:created_at).last)
    assert_match(/\AREQ-[A-F0-9]{16}\z/, ServiceRequest.order(:created_at).last.request_number)
  end

  test "should show service request" do
    get service_request_url(@service_request)
    assert_response :success
  end

  test "should return a JSON service request" do
    get service_request_url(@service_request, format: :json)

    assert_response :success
    assert_equal @service_request.request_number, response.parsed_body["request_number"]
  end

  test "should update service request" do
    patch service_request_url(@service_request), params: {
      service_request: { title: "Updated issue", status: "acknowledged" }
    }

    assert_redirected_to service_request_url(@service_request)
    assert_equal "Updated issue", @service_request.reload.title
    assert_not_nil @service_request.acknowledged_at
  end

  test "should destroy service request" do
    assert_difference("ServiceRequest.count", -1) do
      delete service_request_url(@service_request)
    end

    assert_redirected_to service_requests_url
  end
end
