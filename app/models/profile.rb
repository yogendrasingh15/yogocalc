class Profile < ApplicationRecord
  GENDERS = %w[male female other].freeze

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :mobile, presence: true
  validates :pincode, presence: true
  validates :gender, inclusion: { in: GENDERS }, allow_blank: true
end
