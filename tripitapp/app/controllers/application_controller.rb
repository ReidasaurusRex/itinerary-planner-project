class ApplicationController < ActionController::Base

before_action :prevent_login_signup, only: [
  :access_login,
  :access_signup,
  :access_create,
  :access_attempt_login
]
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

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end


private

def mandatory_login
  if session[:user_id].nil?
    redirect_to login_path
  end
end

def prevent_login_signup
  if session[:user_id]
    redirect_to "/users/#{@user.id}"
  end
end
