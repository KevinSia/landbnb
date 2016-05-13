class Public::PaymentController < ApplicationController

  before_action :find_reservation
  before_action :authenticate_user

  def new
  end

  def create
  end

  private

  def find_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end

  def authenticate_user
    unless current_user == @reservation.user
      flash[:warning] = 'Unauthorize user'
      redirect_to '/'
    end
  end
end