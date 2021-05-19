class BookingsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @booking = Booking.new
    @bike = Bike.find(params[:bike_id])
  end

  def create
    @booking = Booking.new(strong_booking_params)
    @bike = Bike.find(params[:bike_id])
    @booking.bike = @bike
    @booking.renter = current_user
    if @booking.save
      redirect_to bikes_path
    else
      render :new
    end
  end

  private

  def strong_booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end

end
