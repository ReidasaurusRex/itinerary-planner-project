class ApplicationController < ActionController::Base


before_action :mandatory_login, only: [
    :itinerary_destinations,
    :new_itinerary_destination, 
    :edit_itinerary_destination, 
    :itinerary_destination, 
    :itineraries,                 #index
    :new_itinerary, 
    :edit_itinerary, 
    :itinerary,                   #show
    :users_show, 
    :users_edit
] 
  protect_from_forgery with: :exception
end


private

def mandatory_login
  if session[:user_id].nil?
    redirect_to login_path
  end
end
