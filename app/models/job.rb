class Job < ApplicationRecord

  scope :sorted, lambda { order('deadline ASC') }

  validates :title, presence: true
  validates :description, presence: true
end
