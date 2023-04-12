class Post < ApplicationRecord
  validates :title, presence: true
  validates :url,   presence: true, format: { with: /\A#{URI::regexp(%w(http https))}\z/, message: 'を適切に入力してください' }
  validates :image, presence: true
  belongs_to :user
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :favorites
end
