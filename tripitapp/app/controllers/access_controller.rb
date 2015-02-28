class AccessController < ApplicationController

before_action :prevent_login_signup, only: [] #__root route__, __login_path__
before_action :mandatory_login, only: [] #ALL THE ROUTES!!


  def signup
    @user = User.new
  end

  def login
  end

  def create
    @user = User.create user_params
    if @user.save
      session[:user_id] - @user.user_id
      #redirect_to __root route?__, notice: "User created successfully, please log in."
    else
      #redirect_to __login_path__, notice: "Could not create user, please try again."
    end
  end

  def attempt_login
    if params[:user_name].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
        if authorized_user
          session[:user_id] = authorized_user.id
          #redirect_to __Itinerary Index, notice: "You are successfully logged in"
        else
          #redirect_to __login_path__, notice: "Invalid username/password"
        end
      else
        #redirect_to __login_path__, notice: "Invalid username/password"
      end
    else
      #redirect_to __login_path__, notice: "Please enter username/password"
    end
  end

  def logout
    session[:user_id] = nil
    #redirect_to __login_path__
  end
end
