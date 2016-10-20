class Reservation < ApplicationRecord

	belongs_to :user
	belongs_to :listing
	has_many :reservation_dates

end
