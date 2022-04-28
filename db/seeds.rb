# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"

def seed_airports
  CSV.foreach(Rails.root.join("lib/seed-csv/airport-seeds.csv"),
              encoding: "UTF-8",
              headers: true,
              header_converters: :symbol,
              converters: :all) do |row|
    Airport.create(row.to_hash)
  end
end

def format_time(time)
  "#{time.hour.to_s.rjust(2,"0")}:#{time.min.to_s.rjust(2,"0")}"
end

def read_flight_data
  flight_times = []
  CSV.foreach(Rails.root.join("lib/seed-csv/flight-times.csv"), headers: true) do |row|
    flight_times << row.to_hash
  end
  flight_times
end

def seed_flights
  flight_times_data = read_flight_data
  flight_times_data.each do |row|
    departure_airport = Airport.where("code = ?", row["Airport_code"]).first.id
    create_flights(row, departure_airport)
  end
end

def create_flights(flight_data, departure_airport)
  seconds_in_hour = 3600
  flight_data.each do |airport, flight_time|
    next if airport == "Airport_code"

    departure_time = Time.new(2022, 4, 28, rand(5..22), rand(59))
    arrival_airport = Airport.where("code = ?", airport).first.id
    arrival_time = departure_time + flight_time.to_f * seconds_in_hour
    Flight.create(departure_airport_id: departure_airport,
                  arrival_airport_id: arrival_airport,
                  departure_time: departure_time,
                  arrival_time: arrival_time)
  end

end

seed_airports
seed_flights
