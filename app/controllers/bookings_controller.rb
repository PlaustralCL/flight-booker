class BookingsController < ApplicationController
  def new
    @flight_info = Flight.flight_details(params[:flight]).first
    @travel_date = params[:travel_date].to_date

    @booking = Booking.new
    params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
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
end
