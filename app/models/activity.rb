class Activity < ActiveRecord::Base
  belongs_to :user
  enum status: [:learned, :follow, :unfollow]

  validates :user_id, presence: true
  validates :target_id, presence: true

  def target
    learned? ? Lesson.find(target_id) : User.find(target_id)
  end
end
