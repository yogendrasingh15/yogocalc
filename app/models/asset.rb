class Asset < ApplicationRecord
  self.inheritance_column = :_type_disabled

  has_one_attached :file

  ASSET_TYPES = %w[image document video audio other].freeze

  validates :asset_type, presence: true, inclusion: { in: ASSET_TYPES }

  def file_url
    return unless file.attached?

    host = ENV.fetch('APP_HOST', 'localhost:3000')
    host = "http://#{host}" unless host.start_with?('http://', 'https://')

    Rails.application.routes.url_helpers.rails_blob_url(file, host: host)
  rescue StandardError
    nil
  end
end
