class BookingsController < ApplicationController
  def new
    @num_passengers = params[:passengers]
    @flight_details = Flight.flight_details(params[:flight]).first

    @booking = Booking.new
    params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes:[:id, :name, :email])
  end
end
