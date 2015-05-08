class Lesson < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :lessons_words
  has_many :words, through: :lessons_words
end
