class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :lessons_words, dependent: :destroy
  has_many :lessons, through: :lessons_words

  validates :content, presence: true, length: {minimum: 2, maximum: 20}
   
  accepts_nested_attributes_for :answers, allow_destroy: true
end
