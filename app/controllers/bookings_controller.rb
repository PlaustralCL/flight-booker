class BookingsController < ApplicationController
  def new
    @flight_info = Flight.flight_details(params[:flight]).first
    @travel_date = params[:travel_date].to_date

    @booking = Booking.new
    params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(flight_id: booking_params[:flight_id], travel_date: booking_params[:travel_date])

    passenger_params.each do |key, passenger_details|
      passenger = find_or_create_passenger(passenger_details)
      @booking.passengers = @booking.passengers << passenger
    end

    if @booking.save
      send_confirmation_email
      redirect_to @booking
    else
      @flight_info = @booking.flight
      @travel_date = @booking.travel_date.to_date
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :travel_date, passengers_attributes:[:id, :name, :email])
  end

  def passenger_params
    booking_params[:passengers_attributes]
  end

  def find_or_create_passenger(passenger_details)
    passenger = Passenger.find_by(email: passenger_details[:email])
    if passenger
      passenger
    else
      Passenger.create(name: passenger_details[:name], email: passenger_details[:email])
    end
  end

  def send_confirmation_email
    passenger_params.each do |_key, passenger|
      PassengerMailer.confirmation_email(booking_params, passenger).deliver_later
    end
  end
end
