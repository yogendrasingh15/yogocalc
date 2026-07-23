class Asset < ApplicationRecord
  has_one_attached :file

  def file_url
    return unless file.attached?

    host = ENV.fetch('APP_HOST', 'localhost:3000')
    host = "http://#{host}" unless host.start_with?('http://', 'https://')

    Rails.application.routes.url_helpers.rails_blob_url(file, host: host)
  rescue StandardError
    nil
  end
end
