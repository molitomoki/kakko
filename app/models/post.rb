class Post < ApplicationRecord
  validates :title, presence: true
  validates :url,   presence: true
  belongs_to :user
  has_one_attached :image
end
