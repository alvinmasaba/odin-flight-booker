class PassengerMailer < ApplicationMailer
  default from: 'booking@funkyflights.com'

  def confirmation_email(passenger)
    @passenger = passenger
    @flight = passenger.booking.flight
    @url = booking_url(passenger.booking)

    mail(to: @passenger.email, subject: 'Your Booking Has Been Confirmed')
  end
end
