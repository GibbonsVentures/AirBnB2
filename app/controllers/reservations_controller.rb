class ReservationsController < ApplicationController
  

	def create
    @reservation = Reservation.new(reservations_params)
    if Reservation.available(@reservation)
      @reservation.save
      redirect_to place_path(@reservation.place), notice: 'You reserved this place!'
    else
      redirect_to :back, notice: "This room is not avaiable for those dates!"
    end
  end

  def destroy
    @reservation.destroy
    redirect_to places_url
  end


  

private

  def reservations_params
    params.require(:reservation).permit(:check_in, :check_out, :place_id, :user_id)
  end
end