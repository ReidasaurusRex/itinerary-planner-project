class DestinationsController < ApplicationController
  def new

  end

  def create

  end

  def show
  @itinerary = Itinerary.find(params[:itinerary_id])
  @destination = @itinerary.destinations.where(:id == params[:id])
  end

  def edit
  end

  def delete
  end
end
