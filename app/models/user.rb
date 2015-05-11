class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  
  attr_accessor :remember_token
  
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
    format: {with: VALID_EMAIL_REGEX, message: I18n.t(:email_invalid_format) }
  validates :password, confirmation: true, presence: true, allow_blank: true
  
  has_secure_password
  
  def User.digest string 
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost 
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)  
  end
  
  def authenticated? remember_token 
    return false if remember_digest.nil?
    BCrypt::Password.new remember_digest.is_password? remember_token 
  end
  
  def forget
    update_attribute :remember_digest, nil 
  end

  def is_admin?
    redirect_to log_in_path unless level?
  end
end
