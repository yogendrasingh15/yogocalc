class Offer < ApplicationRecord
  OFFER_TYPES = %w[flight hotel holiday package visa cruise].freeze
  STATUSES = %w[draft active expired sold_out].freeze

  validates :title, presence: true
  validates :offer_type, presence: true, inclusion: { in: OFFER_TYPES }
  validates :destination, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :original_price, presence: true, numericality: { greater_than: 0 }
  validates :discount_percentage, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }

  validate :end_date_after_start_date

  def discount_amount
    (original_price.to_f - price.to_f).max(0)
  end

  def savings_percentage
    return 0 if original_price.to_f.zero?

    ((discount_amount / original_price.to_f) * 100).round(2)
  end

  private

  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?

    errors.add(:end_date, "must be after the start date") if end_date < start_date
  end
end
