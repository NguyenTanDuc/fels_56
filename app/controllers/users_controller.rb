class UsersController < ApplicationController
  def show
    @user = User.find param[:id]    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Welcome To The Framgia E-Learning System!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private

  def user_params
    params.require :user.permit :name, :email, :password, :password_confirmation
  end
end
