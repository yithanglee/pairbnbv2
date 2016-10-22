class Reservation < ApplicationRecord

	belongs_to :user
	belongs_to :listing
	has_many :reservation_dates, dependent: :destroy


	def start_time 
		self.checkin
	end

end
