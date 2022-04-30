class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.order(:code).map { |airport| [airport.code, airport.id] }
    @flights = Flight.new
  end
end
