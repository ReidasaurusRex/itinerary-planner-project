class DestinationsController < ApplicationController
  before_action :find_itin
  before_action except: [:new, :create] do 
    find_destination @itinerary
  end
  before_action :mandatory_login

  def new
  end

  def create
    @itinerary.destinations.create destination_params 
    redirect_to "/itineraries/#{@itinerary.id}"
  end

  def show
  end

  def edit
  end

  def update
    redirect_to "/itineraries/#{@itinerary.id}"
  end

  def delete
    redirect_to "/itineraries/#{@itinerary.id}"
  end

  def add_user
    @available_users = @itinerary.users - @destination.users
  end

  def create_destination_user
    @destination.users.create user_params
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
