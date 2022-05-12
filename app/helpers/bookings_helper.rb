module BookingsHelper
  def format_departure(booking)
    "#{booking.flight.departure_airport.city} (#{booking.flight.departure_airport.code}) at #{booking.flight.departure_time.localtime.strftime("%H:%M %p")}"
  end

  def format_arrival(booking)
    "#{booking.flight.arrival_airport.city} (#{booking.flight.arrival_airport.code}) at #{booking.flight.arrival_time.localtime.strftime("%H:%M %p")}"
  end
end
