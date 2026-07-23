class Contact < ApplicationRecord
  belongs_to :role, optional: true

  scope :search, ->(term) {
    return all if term.blank?

    query = "%#{term.to_s.strip.downcase}%"
    where(
      'LOWER(name) LIKE :query OR LOWER(email) LIKE :query OR LOWER(mobile) LIKE :query OR LOWER(address) LIKE :query',
      query: query
    )
  }

  scope :with_role, ->(role_id) { where(role_id: role_id) if role_id.present? }
  scope :with_gender, ->(gender) { where(gender: gender) if gender.present? }

  validates :name, presence: true
  validates :mobile, presence: true, format: { with: /\A[+\d][\d\-\s]+\z/, message: 'must be a valid phone number' }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :gender, inclusion: { in: %w[Male Female Other], allow_blank: true }
end
