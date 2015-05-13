class Lesson < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :lessons_words
  has_many :words, through: :lessons_words

  after_create :marking

  accepts_nested_attributes_for :lessons_words, allow_destroy: true

  private
  def marking
    @mark = self.lessons_words.word_correct.count
    update_attributes mark: @mark 
  end
end
