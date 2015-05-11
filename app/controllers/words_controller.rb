class WordsController < ApplicationController
  def index
    @words = Word.paginate page: params[:page], per_page: 20
    @categories = Category.all
  end

  private
  def word_params
    params.require(:word).permit :content, :category_id, answers_attributes: [:id, :content, :correct]
  end

end
