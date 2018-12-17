class CandidateJob < ApplicationRecord
  belongs_to :candidate
  belongs_to :job

  validates :candidate_id, presence: true, uniqueness: { scope: :job_id }
  validates :job_id, presence: true
  validates :expected_salary, presence:true, numericality: true
end
