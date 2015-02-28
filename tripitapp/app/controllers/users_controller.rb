class UsersController < ApplicationController

before_action :find_user, only: [:edit, :update]
before_action :user_params, only: [:edit, :user_edit]

  def index          #get 'users/show', as: :user
    @users = Users.all
  end

  def update          #put 'user/edit'
    @user.update_attributes user_params
    redirect_to @user
  end

  def user_edit     #get 'user/edit', as: :user_edit
  end


  private
  def user_params
    params.require(:user).permit(:username, :password, :password_digest)
  end
end
