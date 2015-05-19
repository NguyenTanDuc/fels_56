class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user

  def index
    @categories = Category.paginate page: params[:page], per_page: 20
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
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      flash[:success] = t :update_success
      redirect_to admin_categories_path
    else
      render "edit"
    end
  end

  def destroy
    @category = Category.find params[:id]
    if @category.destroy
      flash[:success] = t :delete_success
      respond_to do |format|
        format.html {redirect_to admin_categories_url}
        format.json
        format.js
      end
    else
      flash[:danger] = t :delete_fail
      redirect_to admin_categories_path
    end
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
