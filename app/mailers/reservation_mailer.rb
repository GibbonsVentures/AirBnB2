class ReservationMailer < ActionMailer::Base
  default from: "from@example.com"

  def reservation_confirmation(reservation)
    @guest = User.find(reservation.user_id)
    @place = Place.find(reservation.place_id)
    @owner = User.find(@place.user_id)

    mail to: [@guest.email, @owner.email], subject: "Reservation Confirmation"
  end
end
