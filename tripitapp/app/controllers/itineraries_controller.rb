class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all 
  end

  def new
    @itinerary = Itinerery.new
  end

  def create
    Itinerary.create itinerary_params
    redirect_to itineraries_path
  end

  def show
    @itineraries = Itinerary.all - @destination.users
    @reviews = @itinerary.reviews
  end

  def edit
  end

  def update
    @itinerary.update_attributes itinerary_params
    redirect_to @itinerary


  def delete
    @itinerary.destroy
    redirect_to itineraries_path
  end
  end

  def add_destination
    destination = Destination.find(destination_params[:id])
    unless @itinerary.destinations.include? destination
      @itinerary.destinations << destination
    end
    redirect_to @itinerary
  end

  def remove_destination
    @itinerary.destination.delete(Destination.find(params[:destination_id]))
    redirect_to @itinerary 
  end

  private
  def itinerary_params
    params.require(:itinerary).permit(:id, :name)
  end

  def destination_params
    params.require(:destination).permit(:id, :name)
  end

  def user_params
    params.require(:user).permit(:id, name)
  end

  def find_itinerary
    @itinerary = Itinerary.find(params[:id])
  end
end
