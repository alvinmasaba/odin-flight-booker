class PassengerMailer < ApplicationMailer
  default from: 'notification@alvin.com'

  def welcome_email
    @user = params[:user]
    @url = params[:url]
    mail(to: @user.email, subject: 'Welcome to your Kodak Moment!')
  end
end
