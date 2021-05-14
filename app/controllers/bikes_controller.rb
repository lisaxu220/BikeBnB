class BikesController < ApplicationController

before_action :set_bike, only: [:show]

def index
  @bikes = Bike.all
end

def show
end

def new
  @bike = Bike.new
end

def create
  @bike = Bike.new(new_bike_params)
  @bike.owner = current_user
  if @bike.save
    redirect_to bikes_path
  else
    render :new
  end
end

private

def new_bike_params
  params.require(:bike).permit(:owner_id, :name, :description, :capacity, :price)
end

def set_bike
  @bike = Bike.find(params[:id])
end

end
