class Group < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  validates :title, presence: true

  has_many :users
  has_many :posts
end
