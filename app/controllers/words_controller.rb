class WordsController < ApplicationController
  before_action :logged_in_user
  
  def index
    @categories = Category.all
    filter = ['learned', 'not_learned']
    if filter.include? params[:filter]
      @words = Word.in_category(params[:category_id]).send(params[:filter], current_user)
                                                     .paginate page: params[:page], per_page: 20
    else
      @words = Word.in_category(params[:category_id]).paginate page: params[:page], per_page: 20
    end
  end
end
