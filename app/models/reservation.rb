class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  validates :listing_id, presence: true
  validates :user_id, presence: true
  validates :pax, inclusion: { in: (1..16) }
  validate :booking_dates
  # validate :if_own_listing

  def dates
  end

  def dates=(input_dates)
    dates = input_dates.split(' - ')
    self.check_in_date = Date.strptime(dates[0], '%d/%m/%Y')
    self.check_out_date = Date.strptime(dates[1], '%d/%m/%Y')
  end

  def date_diff
    (check_out_date - check_in_date).to_i
  end

  def pax=(pax)
    super
    self.price = pax.to_i * date_diff
  end

  def booking_dates
    errors.add(:check_in_date, ' has been taken') unless listing.reservations.where('? >= check_in_date AND ? <= check_out_date',
      check_in_date, check_in_date).empty?
    errors.add(:check_out_date, ' has been taken') unless listing.reservations.where('? >= check_in_date AND ? <= check_out_date',
      check_out_date, check_out_date).empty?
  end

  # def if_own_listing
  #   listing = Listing.find(listing_id)
  #   errors.add(:user_id, ' is your own id!') if listing.user.id == user_id
  # end
end
