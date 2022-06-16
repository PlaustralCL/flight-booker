class PassengerMailer < ApplicationMailer
  default from: "confirmation@flight-booker.com"

  def confirmation_email(booking_details, passenger_details)
    flight = Flight.find(booking_details["flight_id"])

    @passenger = passenger_details
    # @booking = booking_details
    @travel_date = booking_details["travel_date"]
    @departure = flight_departure(flight)
    @arrival = flight_arrival(flight)

    # @test.stop
    mail(to: @passenger[:email], subject: "Flight Booking Confirmation")
  end


  private

  def flight_departure(flight)
    "#{flight.departure_airport.city} (#{flight.departure_airport.code}) at #{flight.departure_time.localtime.strftime("%H:%M %p")}"
  end

  def flight_arrival(flight)
    "#{flight.arrival_airport.city} (#{flight.arrival_airport.code}) at #{flight.arrival_time.localtime.strftime("%H:%M %p")}"
  end

end
