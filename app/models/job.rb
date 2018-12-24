class Job < ApplicationRecord
  has_many :candidate_jobs
  has_many :candidates, through: :candidate_jobs, dependent: :destroy

  scope :sorted, -> { order('deadline ASC') }
  validates :title, :description, presence: true
end
