class UsersController < ApplicationController

before_action :user_params, only: [:user_edit]

  def index          
    @users = Users.all
  end

  def user_edit     #get 'users/:id/edit', to: "users#user_edit", as: :user_edit
    @user = User.find(params[:id])
    params.require(@user).permit(:first_name, :last_name, :username, :email)
  end

  def show            #get 'users/:id', to: "users#show", as: :user_show
    @user = User.find(params[:id])
    #@itineraries = Itineraries.all ... but only this users
    #@destinations = Destinations.all ... that this user is going on
  end

  def update          #put 'users/:id/edit', to: "users#update"
    @user.update_attributes
    redirect_to @user
  end



  private
 
end
