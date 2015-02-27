class AccessController < ApplicationController
  def login
  end

  def signup
  end

  def create

    redirect_to index_path
  end

  def attempt_login

    redirect_to index_path
  end

  def logout

    redirect_to login_path
  end
end
