class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def destroy
  end

  def edit

  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :encrypted_password)
  end

end
