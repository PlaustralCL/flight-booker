class BookingsController < ApplicationController
  def new
    @flight = params
    @num_passengers = params[:passengers]
    @flight_details = Flight.flight_details(params[:flight]).first

    @booking = Booking.new
    params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create

  end
end
