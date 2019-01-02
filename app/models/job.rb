class Job < ApplicationRecord
  has_many :candidate_jobs
  has_many :candidates, through: :candidate_jobs

  scope :sorted_by_deadline, -> { order('deadline ASC') }
  validates :title, :description, presence: true
end
