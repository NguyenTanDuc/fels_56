class LessonsController < ApplicationController
  before_action :logged_in_user

  def new
    @category = Category.find params[:category_id]
    @lesson = @category.lessons.build
    @words = @category.words.random_words
    @words.each do |word|
      @lesson.lessons_words.build word_id: word.id
    end
  end

  def create
    @category = Category.find params[:category_id]
    @lesson = @category.lessons.new lesson_params
    @lesson.user_id = current_user.id
    if @lesson.save
      redirect_to category_lesson_path @category, @lesson
    else
      flash[:danger] = t :create_fail
      redirect_to root_path
    end
  end

  def show
    @category = Category.find params[:category_id]
    @lesson = Lesson.find params[:id]
    @lessons_words = @lesson.lessons_words.all
    respond_to do |format|
      format.html
      format.csv {send_data @lessons_words.to_csv}
      format.xls
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit lessons_words_attributes: [:word_id, :answer_id, :word_correct]
  end
end
