class AccessController < ApplicationController

before_action :user_params, only: [:create_user, :login, :access_attempt_login]


  def signup              #/accesss/signup GET
    @user = User.new
  end

  def login               #/access/login GET
  end

  def create_user         #/access/create POST
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to access_login_path, notice: "User created successfully, please log in."   #redirect logged in && to home/index-y page
    else
      redirect_to access_signup_path, notice: "Could not create user, please try again."
    end
  end

  def access_attempt_login
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

private

  def user_params
    params.require(:user).permit(:username, :password, :password_digest)
  end

end