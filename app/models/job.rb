class Job < ApplicationRecord
  has_many :candidate_jobs
  has_many :candidates, through: :candidate_jobs

  scope :sorted_by_deadline, -> { order('deadline ASC') }
  scope :sorted_by_created_at, -> { order('created_at ASC') }
  validates :title, :description, presence: true

  def start_time
    deadline
  end
end
