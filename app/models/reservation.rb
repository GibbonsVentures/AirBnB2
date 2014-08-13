class Reservation < ActiveRecord::Base
	belongs_to :place
	belongs_to :user

def self.available(reservation)
    if reservation.check_in && reservation.check_out
      this_places_reservations = Reservation.where(place_id: reservation.place_id)
      this_places_reservations.each do |r|
        if reservation.check_in.between?(r.check_in, r.check_out) || reservation.check_in.between?(r.check_in, r.check_out)
          return false
        end
      end
      true
    end
  end
end
