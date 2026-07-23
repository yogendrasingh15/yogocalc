json.extract! asset, :id, :title, :description, :file, :created_at, :updated_at
json.url asset_url(asset, format: :json)
json.file url_for(asset.file)
