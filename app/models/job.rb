class Job < ApplicationRecord
  scope :sorted, lambda { order('deadline ASC') }

  validates :title, :description, presence: true
end
