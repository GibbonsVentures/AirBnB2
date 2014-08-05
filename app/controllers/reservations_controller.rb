class ReservationsController < ApplicationController

	def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      redirect_to @reservation, notice: 'You reserved this place!'
    else
      render action: 'new'
    end
  end

  def destroy
    @reservation.destroy
    redirect_to places_url
  end
end