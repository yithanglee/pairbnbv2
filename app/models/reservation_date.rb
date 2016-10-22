class ReservationDate < ApplicationRecord
	belongs_to :reservation

	def start_time 
		self.staying_dates
	end


end
