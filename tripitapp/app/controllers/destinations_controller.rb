class DestinationsController < ApplicationController
  before_action :find_itin

  def new
  end

  def create
    @itinerary.destinations.create destination_params 
  end

  def show
    find_destination @itinerary
  end

  def edit
    find_destination @itinerary
  end

  def delete
  end

  private
  def destination_params
    params.require(:destination).permit(:id, :location, :name, :date)
  end

  def find_itin
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def find_destination itinerary
    @destination = itinerary.destinations.find(params[:id])
  end
end
