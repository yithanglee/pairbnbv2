class Reservation < ApplicationRecord

	belongs_to :user
	has_many :booking_dates
	has_many :listings, through: :booking_dates
end
