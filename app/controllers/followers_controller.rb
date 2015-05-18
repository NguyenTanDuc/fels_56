class FollowersController < ApplicationController
  def index
    @title = t :followers
    @user = User.find params[:id]
    @users = @user.followers.paginate page: params[:page]
    render 'show_follow'
  end
end
