class Public::ReservationsController < ApplicationController
  def create
    @listing = Listing.find(reservation_params[:listing_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      # ReservationMailer.reservation_email(current_user, @listing.user, @reservation.id).deliver_now
      # ReservationJob.perform_later(current_user, @listing.user, @reservation.id)
      redirect_to new_reservation_payment_path(@reservation)
    else
      render 'public/listings/show'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:listing_id, :user_id, :dates, :pax)
  end
end