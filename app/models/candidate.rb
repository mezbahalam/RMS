class Candidate < ApplicationRecord
  Gender = %w[Male Female]
  scope :sorted, lambda {order('dob ASC')}
  validates :name, presence: true
  validates :email, presence: true,uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :skill,:experience,:personal_interest, presence: true
end
