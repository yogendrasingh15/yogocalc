class Ticket < ApplicationRecord
  belongs_to :user

  validates :title, :project_id, :status, :priority, :user, presence: true
  validates :ticket_number, uniqueness: true, allow_blank: true

  before_validation :generate_ticket_number, on: :create

  STATUS_OPTIONS = %w[open in_progress resolved closed re_open].freeze
  PRIORITY_OPTIONS = [["Low", 0], ["Medium", 1], ["High", 2]].freeze
  PROJECT_OPTIONS = [["Project 1", 1], ["Project 2", 2], ["Project 3", 3]].freeze

  private

  def generate_ticket_number
    self.ticket_number ||= "TKT-#{Time.current.strftime('%Y%m%d%H%M%S')}"
  end
end
