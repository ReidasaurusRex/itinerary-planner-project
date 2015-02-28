class UsersController < ApplicationController
  def show
    #
  end

  def edit
    #
  end

  def remove
  end


  private
  def user_params
    params.require(:user).permit(:username, :password, :password_digest)
  end
end
