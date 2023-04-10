class Review < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :total, presence: true
  validates :concept, presence: true
  validates :quality, presence: true
  validates :usability, presence: true
  validates :utility, presence: true
end
