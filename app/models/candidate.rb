class Candidate < ApplicationRecord
  has_one_attached :avatar
  Gender = %w[Male Female]
  scope :sorted, lambda {order('experience ASC')}
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :skill,:personal_interest, presence: true
  validates :experience, presence: true, numericality: true
end
