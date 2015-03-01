class UsersController < ApplicationController

before_action :find_user, only: [:user_edit, :show, :update]
before_action :user_params, only: [:user_edit, :update]


  def index          
    @users = Users.all
  end

  def user_edit     #get 'users/:id/edit', to: "users#user_edit", as: :user_edit
  end

  def show            #get 'users/:id', to: "users#show", as: :user_show
    #@itineraries = Itineraries.all ... but only this users
    #@destinations = Destinations.all ... that this user is going on
  end

  def update          #put 'users/:id/edit', to: "users#update"
    @user.update_attributes
    redirect_to @user
  end



  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(@user).permit(:first_name, :last_name, :username, :email)
  end
 
end
