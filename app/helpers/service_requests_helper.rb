module ServiceRequestsHelper
  def service_request_status_class(status)
    case status
    when "open", "acknowledged"
      "text-bg-primary"
    when "in_progress"
      "text-bg-info"
    when "on_hold"
      "text-bg-warning"
    when "resolved"
      "text-bg-success"
    when "closed", "cancelled"
      "text-bg-secondary"
    else
      "text-bg-light"
    end
  end

  def service_request_priority_class(priority)
    case priority
    when "urgent"
      "text-bg-danger"
    when "high"
      "text-bg-warning"
    when "normal"
      "text-bg-primary"
    else
      "text-bg-light"
    end
  end
end
