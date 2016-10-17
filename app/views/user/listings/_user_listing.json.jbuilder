json.extract! user_listing, :id, :title, :description, :location, :price, :availability, :created_at, :updated_at
json.url user_listing_url(user_listing, format: :json)