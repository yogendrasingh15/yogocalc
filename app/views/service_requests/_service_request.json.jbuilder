json.extract! service_request, :id, :tenant_id, :customer_id, :solar_site_id, :solar_system_id,
              :solar_component_id, :request_number, :request_type, :category, :subcategory,
              :title, :description, :reported_by, :reported_channel, :priority, :severity,
              :status, :reported_at, :acknowledged_at, :resolved_at, :closed_at,
              :customer_visible, :preferred_visit_date, :preferred_visit_time,
              :attachments_count, :created_at, :updated_at
json.url service_request_url(service_request, format: :json)
