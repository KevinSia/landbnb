class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  validates :listing_id, presence: true
  validates :user_id, presence: true

  def dates
  end
end
