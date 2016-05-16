class Public::ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @reserve_dates = Reservation.reserve_dates
  end
end