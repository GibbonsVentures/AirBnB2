class ReservationsController < ApplicationController
  before_filter :authenticate_user!
  
  
  

  def create
    @reservation = Reservation.create(guest: current_user, place: Place.find(params[:place_id]))
    if @reservation.save
      redirect_to place_path(@reservation.place), notice: 'You reserved this place!'
    else
      redirect_to back, notice: 'Your reservation did not save'
    end
  end

  def reject
    load_reservation.reject!
    redirect_to places_path
  end

  def accept
    load_reservation.accept!
    redirect_to places_path
  end

 

  

private
  def load_reservation()
    current_user.reservations.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :place_id, :guest_id)
  end
end