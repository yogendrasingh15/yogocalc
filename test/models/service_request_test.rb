require "test_helper"

class ServiceRequestTest < ActiveSupport::TestCase
  test "generates a request number and report timestamp" do
    freeze_time do
      request = ServiceRequest.create!(
        request_type: "repair",
        title: "Inverter stopped reporting",
        reported_channel: "customer_portal",
        request_number: "CUSTOM-NUMBER",
        reported_at: 1.year.ago
      )

      assert_match(/\AREQ-[A-F0-9]{16}\z/, request.request_number)
      assert_equal Time.current, request.reported_at
    end
  end

  test "accepts only supported reporting channels" do
    request = ServiceRequest.new(
      request_type: "repair",
      title: "Inverter stopped reporting",
      reported_channel: "unknown"
    )

    assert_not request.valid?
    assert_includes request.errors[:reported_channel], "is not included in the list"
  end

  test "sets lifecycle timestamps when a request advances" do
    request = ServiceRequest.create!(
      request_type: "repair",
      title: "Inverter stopped reporting",
      reported_channel: "phone",
      status: "closed"
    )

    assert_not_nil request.resolved_at
    assert_not_nil request.closed_at
  end
end
