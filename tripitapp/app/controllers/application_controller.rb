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

before_action :prevent_relogin, only: [
    :login_path,
    :signup_path
]
  protect_from_forgery with: :exception
end


private

def mandatory_login
  if session[:user_id].nil?
    redirect_to login_path
  end
end

def prevent_relogin
  if session[:user_id]
    redirect_to user_show_path
  end
end
