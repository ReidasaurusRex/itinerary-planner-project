class AccessController < ApplicationController

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

  def signup
    @user = User.new
  end

  def login
  end

  def create
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.user_id
      redirect_to access_login_path, notice: "User created successfully, please log in."
    else
      redirect_to access_signup_path, notice: "Could not create user, please try again."
    end
  end

  def attempt_login
    if params[:user_name].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
        if authorized_user
          session[:user_id] = authorized_user.id
          redirect_to itineraries_path, notice: "You are successfully logged in" #I think we need a users path which displays their itineraries.
        else
          redirect_to access_login_path, notice: "Invalid username/password"
        end
      else
        redirect_to access_login_path, notice: "Invalid username/password"
      end
    else
      redirect_to access_login_path, notice: "Please enter username/password"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to access_login_path, notice: "Thanks for logging out. Check back later"
  end
end

private

def mandatory_login
  if session[:user_id].nil?
    redirect_to access_login_path
  end
end

def prevent_login_signup
  if session[:user_id]
    redirect_to users_show_path
  end
end




