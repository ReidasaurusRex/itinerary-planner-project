class AccessController < ApplicationController

  def signup            #get 'access/signup', as: :signup
    @user = User.new
  end

  def login               #/access/login GET
  end

  def create_user         #/access/create POST
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_digest)

    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path, notice: "User created successfully, please log in."   #redirect logged in && to home/index-y page
    else
      redirect_to signup_path, notice: "Could not create user, please try again."
    end
  end

  def login               #get 'access/login', as: :login
  end

  def access_attempt_login   #post 'access/attempt_login'
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_digest)
    binding.pry
    if params[:user][:username].present? && params[:user][:password].present?
      found_user = User.where(username: params[:user][:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:user][:password])
        if authorized_user
          session[:user_id] = authorized_user.id
          redirect_to itineraries_path, notice: "You are successfully logged in" #I think we need a users path which displays their itineraries.
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
  params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_digest)
end
