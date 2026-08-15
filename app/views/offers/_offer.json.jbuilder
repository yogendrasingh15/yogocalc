json.extract! offer, :id, :title, :offer_type, :destination, :description, :price, :original_price, :discount_percentage, :start_date, :end_date, :status, :is_featured, :image_url, :created_at, :updated_at
json.url offer_url(offer, format: :json)
