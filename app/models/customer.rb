class Customer < ApplicationRecord
  has_many :accounts, dependent: :destroy

  CUSTOMER_TYPES = %w[individual business].freeze
  STATUSES = %w[active inactive blocked closed].freeze

  validates :customer_number, presence: true, uniqueness: true
  validates :customer_type, presence: true, inclusion: { in: CUSTOMER_TYPES }
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :customer_since, presence: true

  validates :first_name, presence: true, if: :individual_customer?
  validates :last_name, presence: true, if: :individual_customer?
  validates :business_name, presence: true, if: :business_customer?

  def full_name
    if individual_customer?
      [first_name, middle_name, last_name].reject(&:blank?).join(" ")
    else
      business_name.to_s
    end
  end

  private

  def individual_customer?
    customer_type == "individual"
  end

  def business_customer?
    customer_type == "business"
  end
end
