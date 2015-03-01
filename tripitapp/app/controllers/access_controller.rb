class AccessController < ApplicationController

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
  # before_action :user_params, only: [
  #   :create_user, 
  #   :login, 
  #   :access_attempt_login
  # ]
  
  before_action :prevent_login_signup, only: [:signup, :login]

  # before_action :user_params, only: [
  #   :create_user, 
  #   :login, 
  #   :access_attempt_login
  # ]


  def signup            #get 'access/signup', as: :signup
    @user = User.new
  end

  def login               #/access/login GET

  end

  def create_user         #/access/create POST
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path, notice: "User created successfully, please log in."   #redirect logged in && to home/index-y page
    else
      redirect_to access_signup_path, notice: "Could not create user, please try again."
    end
  end

  def access_attempt_login
  end

  def login               #get 'access/login', as: :login
  end

  def access_attempt_login   #post 'access/attempt_login'

    if params[:user_name].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
        if authorized_user
          session[:user_id] = authorized_user.id
          redirect_to user_path, notice: "You are successfully logged in" #I think we need a users path which displays their itineraries.
        else
          redirect_to login_path, notice: "Invalid username/password"
        end
      else
        redirect_to login_path, notice: "Invalid username/password"
      end
    else
      redirect_to login_path, notice: "Please enter username/password"
    end
  end

  def create_user         #post 'access/create', as: :signup_user
    binding.pry
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}", notice: "User created successfully, please log in."   #redirect logged in && to home/index-y page
    else
      redirect_to login_path, notice: "Could not create user, please try again."
    end
  end

  def logout                 #delete 'logout', to: "access#logout", as: :logout
    session[:user_id] = nil
    redirect_to login_path, notice: "Thanks for logging out. Check back later"
  end


end

private

def user_params
  params.require(:user).permit(:username, :password, :password_digest)

  params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_digest)

end

def mandatory_login
  if session[:user_id].nil?
    redirect_to login_path
  end
end

