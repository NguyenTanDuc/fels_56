class Word < ActiveRecord::Base
  has_many :answers
  has_many :lessons_words
  has_many :lessons, through: :lessons_words
end
