class Reservation < ActiveRecord::Base
	belongs_to :place
	belongs_to :user
  	after_create :send_reservation_confirmation


	def send_reservation_confirmation
    ReservationMailer.reservation_confirmation(self).deliver
  end
end
