class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user
  before_action :is_admin

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t :create_success
      redirect_to admin_categories_path
    else
      render "new"
    end
  end

  def edit
    @category = Category.find params[:id]
    @words = @category.words.paginate page: params[:page], per_page: 20
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      flash[:success] = t :update_success
      redirect_to admin_categories_path
    else
      @words = @category.words.paginate page: params[:page], per_page: 20
      render "edit"
    end
  end

  def destroy
    @category = Category.find params[:id]
    if @category.destroy
      flash[:success] = t :delete_success
      redirect_to admin_categories_path
    else
      flash[:danger] = t :delete_fail
      redirect_to admin_categories_path
    end
  end

  private
  def category_params
    params.require(:category).permit :name
  end

  def is_admin
    redirect_to root_path unless current_user.is_admin?
  end
end
