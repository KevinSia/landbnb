class Public::ReservationsController < ApplicationController
  def create
    @listing = Listing.find(reservation_params[:listing_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      ReservationMailer.reservation_email(current_user, @listing.user, @reservation.id).deliver_now
      flash[:success] = 'Reservation has been made'
      redirect_to user_reservations_path(current_user)
    else
      render 'public/listings/show'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:listing_id, :user_id, :dates, :pax)
  end
end