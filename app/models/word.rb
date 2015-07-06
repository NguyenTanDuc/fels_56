class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :lessons_words, dependent: :destroy
  has_many :lessons, through: :lessons_words

  validates :content, presence: true, length: {minimum: 2, maximum: 20}

  accepts_nested_attributes_for :answers, allow_destroy: true

  scope :learned, ->user{where("words.id IN (SELECT word_id FROM lessons_words, lessons
                                       WHERE lessons.user_id = #{user.id} AND lessons.id = lessons_words.lesson_id)")}
  scope :not_learned, ->user{where("words.id NOT IN (SELECT word_id FROM lessons_words, lessons
                                               WHERE lessons.user_id = #{user.id} AND lessons.id = lessons_words.lesson_id)")}
  scope :in_category, ->category_id{where category_id: category_id if category_id.present?}
  scope :random_words, ->{limit(20).sort_by{rand}}
end
