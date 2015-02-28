class UsersController < ApplicationController
  def show
    #user           /users/show
  end

  def edit
    #user_edit      /users/edit
  end

  def remove
  end


  private
  def user_params
    params.require(:user).permit(:username, :password, :password_digest)
  end
end
