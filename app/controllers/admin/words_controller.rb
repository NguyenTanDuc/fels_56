class Admin::WordsController < ApplicationController  
  before_action :logged_in_user
  before_action :is_admin

  def index
    @words = Word.paginate page: params[:page], per_page: 20
    @categories = Category.all
  end

  def new
    @word = Word.new
    @categories = Category.all
    4.times {@word.answers.build}
  end

  def create   
    @categories = Category.all
    @word = Word.new word_params
    if @word.save
      flash[:success] = t :create_success
      redirect_to admin_words_path
    else
      render "new"
    end
  end  

  def edit
    @word = Word.find params[:id]
    @categories = Category.all
  end

  def update
    @word = Word.find params[:id]
    @categories = Category.all
    if @word.update_attributes word_params
      flash[:success] = t :update_success
      redirect_to admin_words_path
    else
      render 'edit'
    end
  end

  def destroy
    @word = Word.find params[:id]
    if @word.destroy
      flash[:success] = t :delete_success
      redirect_to admin_words_path
    else
      flash[:danger] = t :delete_fail
      redirect_to admin_words_path
    end
  end

  private
  def word_params
    params.require(:word).permit :content, :category_id, answers_attributes: [:id, :content, :correct]
  end

  def is_admin
    redirect_to root_path unless current_user.is_admin?
  end
end
