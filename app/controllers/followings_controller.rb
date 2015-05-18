class FollowingsController < ApplicationController
  def index
    @title = t :following
    @user = User.find params[:id]
    @users = @user.following.paginate page: params[:page]
    render 'show_follow'
  end
end
