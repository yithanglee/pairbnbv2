class Tag < ApplicationRecord
	has_many :listings, through: :listing_tags
	has_many :listing_tags
end
