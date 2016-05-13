class User::ReservationsController < ApplicationController

  before_action :find_reservation, except: :index

  def index
    @reservations = Reservation.all
  end

  def show
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to user_reservation_path(current_user, @reservation)
    else
      render 'user/reservations/edit'
    end
  end

  def destroy
    @reservation.destroy
    redirect_to user_reservations_path(current_user)
  end

  private

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:listing_id, :user_id, :pax, :dates)
  end
end