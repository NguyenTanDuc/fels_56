class UsersController < ApplicationController
  before_action :logged_in_user, except: [:destroy, :new, :create]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.paginate page: params[:page]
  end

  def show
    @user = User.find params[:id]
    @activities = @user.activities.order created_at: :desc
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t :please_check_email
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = t :profile_updated
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = t :please_log_in
      redirect_to log_in_url
    end
  end

  def correct_user
    @user = User.find params[:id]
    redirect_to root_url unless @user == current_user
  end
end
