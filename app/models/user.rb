class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :lessons
  has_many :activities

  validates :name, presence: true
  validates :email, confirmation: true, uniqueness: true, presence: true,
    format: {with: VALID_EMAIL_REGEX, message: "Email Is Invalid Format!"}
  validates :password, confirmation: true, presence: true, allow_blank: true

  has_secure_password
end
