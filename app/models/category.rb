class Category < ActiveRecord::Base
  has_many :lessons, dependent: :destroy
  has_many :words, dependent: :destroy

  validates :name, presence: true, length: {minimum: 2, maximum: 50}, uniqueness: true
end
