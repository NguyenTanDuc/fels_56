class Admin::UsersController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t :user_deleted
    redirect_to users_url
  end
end
