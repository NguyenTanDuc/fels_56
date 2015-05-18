class Lesson < ActiveRecord::Base
  include ActivityLog

  belongs_to :category
  belongs_to :user
  has_many :lessons_words
  has_many :words, through: :lessons_words

  after_create :marking, :learned_activity, :learned_words_count

  accepts_nested_attributes_for :lessons_words, allow_destroy: true

  def learned_words_count
    category.words.learned(user).count
  end

  private
  def marking
    @mark = self.lessons_words.word_correct.count
    update_attributes mark: @mark
  end

  def learned_activity
    create_activity user_id, id, 'learned'
  end
end

