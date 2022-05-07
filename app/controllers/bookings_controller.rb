class BookingsController < ApplicationController
  def new
    @flight = params
  end
end
