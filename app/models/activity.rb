class Activity < ActiveRecord::Base
  belongs_to :user
  enum status: [:follow, :unfollow]

  validates :user_id, presence: true
  validates :target_id, presence: true

  def target
    User.find target_id
  end
end
