class Page < ApplicationRecord
  STATUSES = %w[draft published archived].freeze

  validates :title, presence: true, length: { maximum: 255 }
  validates :slug, presence: true, uniqueness: { case_sensitive: false }, format: {
    with: /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/i,
    message: "must be URL-friendly and contain only letters, numbers, and hyphens"
  }
  validates :content, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }

  before_validation :normalize_slug, if: :title_present?

  scope :ordered, -> { order(:parent_id, :title) }

  def to_param
    slug
  end

  private

  def title_present?
    title.present?
  end

  def normalize_slug
    self.slug = title.to_s.parameterize if slug.blank?
  end
end
