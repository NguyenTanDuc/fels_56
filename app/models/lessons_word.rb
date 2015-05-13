class LessonsWord < ActiveRecord::Base
  belongs_to :word
  belongs_to :lesson

  scope :word_correct, -> {where word_correct: :true }
end
