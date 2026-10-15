class ServiceRequest < ApplicationRecord
  belongs_to :customer, optional: true

  REQUEST_TYPES = %w[repair maintenance inspection complaint information other].freeze
  REPORTED_CHANNELS = %w[
    customer_portal mobile_app phone email whatsapp technician monitoring_system automatic_alert
  ].freeze
  PRIORITIES = %w[low normal high urgent].freeze
  SEVERITIES = %w[low medium high critical].freeze
  STATUSES = %w[open acknowledged in_progress on_hold resolved closed cancelled].freeze

  validates :request_number, presence: true, uniqueness: true
  validates :request_type, presence: true, inclusion: { in: REQUEST_TYPES }
  validates :title, :reported_at, presence: true
  validates :reported_channel, presence: true, inclusion: { in: REPORTED_CHANNELS }
  validates :priority, presence: true, inclusion: { in: PRIORITIES }
  validates :severity, presence: true, inclusion: { in: SEVERITIES }
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :attachments_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :tenant_id, :solar_site_id, :solar_system_id, :solar_component_id,
            numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

  before_validation :generate_request_number, on: :create
  before_validation :set_reported_at, on: :create
  before_validation :set_status_timestamps

  private

  def generate_request_number
    self.request_number = "REQ-#{SecureRandom.hex(8).upcase}"
  end

  def set_reported_at
    self.reported_at = Time.current
  end

  def set_status_timestamps
    self.acknowledged_at ||= Time.current if status == "acknowledged"

    if %w[resolved closed].include?(status)
      self.resolved_at ||= Time.current
    end

    self.closed_at ||= Time.current if status == "closed"
  end
end
