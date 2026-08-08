class Role < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :ordered, -> { order(:name) }
end
