class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    User.create params[:user]
    redirect_to users_path
  end

end
