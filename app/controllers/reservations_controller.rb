class ReservationsController < ApplicationController
  before_filter :authenticate_user!
  
  
	def create
    @reservation = Reservation.create(reservation_params)
    @reservation.user_id = current_user.id
    if Reservation.available(@reservation)
      @reservation.save
      redirect_to place_path(@reservation.place), notice: 'You reserved this place!'
    else
      redirect_to :back, notice: "This room is not avaiable for those dates!"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to places_url
  end


  

private
    

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :place_id, :user_id)
  end
end