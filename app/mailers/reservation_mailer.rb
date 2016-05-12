class ReservationMailer < ApplicationMailer
  def reservation_email(customer, host, reservation_id)
    # customer -> customer object
    # host -> host object
    @customer = customer
    listing_id = Reservation.find(reservation_id).listing_id
    @url = "http://localhost:3000/mylistings/#{listing_id}/reservations/#{reservation_id}"
    mail(to: host.email, subject: 'You received a booking!')
  end
end
