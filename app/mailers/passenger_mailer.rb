class PassengerMailer < ApplicationMailer
  default from: "notifications@example.com"

  def confirmation_email
    @user = { name: "Bob", email: "bob@email.com" }
    @url = "http://example.com"
    mail(to: @user[:email], subject: "Flight Booking Confirmation")
  end
end
