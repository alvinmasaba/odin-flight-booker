class PassengerMailer < ApplicationMailer
  default from: 'booking@funkyflights.com'

  def confirmation_email(passenger)
    @passenger = passenger
    @flight = passenger.booking.flight
    @url = booking_url(passenger.booking)

    attachments.inline['plane.jpeg'] = File.read('app/assets/images/emails/plane.jpeg')
    mail(to: @passenger.email, subject: 'Your Booking Has Been Confirmed')
  end
end
