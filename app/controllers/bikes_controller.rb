class BikesController < ApplicationController
skip_before_action :authenticate_user!, only: :index
before_action :set_bike, only: [:show]

def index
  if params[:query].present?
    @bikes = Bike.search_by_name(params[:query])
  else
    @bikes = Bike.all
  end
end

def show
  @booking = Booking.new
end

def new
  @bike = Bike.new
end

def create
  @bike = Bike.new(new_bike_params)
  @bike.owner = current_user
  if @bike.save
    redirect_to bike_path(@bike)
  else
    render :new
  end
end

private

def new_bike_params
  params.require(:bike).permit(:owner_id, :name, :description, :capacity, :price, photos: [])
end

 def set_bike
  @bike = Bike.find(params[:id])
 end
end
