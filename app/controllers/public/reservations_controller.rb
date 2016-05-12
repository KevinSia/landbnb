class Public::ReservationsController < ApplicationController
  def create
    byebug
  end

  private

  def reservations_params
    params.require(:reservation).permit(:listing_id, :user_id, :dates)
  end
end