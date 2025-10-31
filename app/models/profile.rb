class Profile < ApplicationRecord
  GENDERS = %w[male female other].freeze

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # mobile and pincode are optional because users may not provide them at signup
  validates :mobile, presence: true, allow_blank: true
  validates :pincode, presence: true, allow_blank: true
  validates :gender, inclusion: { in: GENDERS }, allow_blank: true
  belongs_to :user, optional: true
end
