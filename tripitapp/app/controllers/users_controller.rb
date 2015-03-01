class UsersController < ApplicationController

before_action :find_user, only: [:show, :user_edit, :update]
before_action :user_params, only: [:user_edit, :update]

  def index          
    @users = Users.all
  end

  def show            #get 'users/:id', to: "users#show", as: :user_show
  end

  def update          #put 'users/:id/edit', to: "users#update"
    @user.update_attributes user_params
    redirect_to @user
  end

  def user_edit     #get 'users/:id/edit', to: "users#user_edit", as: :user_edit
  end


  private
  def user_params
    params.require(:user).permit(:username, :password, :password_digest)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
