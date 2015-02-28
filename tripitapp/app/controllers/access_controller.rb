class AccessController < ApplicationController

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





