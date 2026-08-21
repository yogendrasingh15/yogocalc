class CustomPage < ApplicationRecord
  PAGE_TYPES = %w[standard landing contact custom].freeze
  STATUSES = %w[draft published archived].freeze

  validates :title, presence: true, length: { maximum: 255 }
  validates :slug, presence: true, uniqueness: { case_sensitive: false }, format: {
    with: /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/i,
    message: "must be URL-friendly and contain only letters, numbers, and hyphens"
  }
  validates :content, presence: true
  validates :page_type, presence: true, inclusion: { in: PAGE_TYPES }
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :template, length: { maximum: 100 }, allow_blank: true
  validates :featured_image, length: { maximum: 500 }, allow_blank: true
  validates :meta_title, length: { maximum: 255 }, allow_blank: true
  validates :canonical_url, length: { maximum: 500 }, allow_blank: true
  validates :robots, length: { maximum: 100 }, allow_blank: true

  before_validation :normalize_slug, if: :title_present?

  scope :ordered, -> { order(:sort_order, :created_at) }
  scope :published, -> { where(status: "published", is_active: true) }

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
