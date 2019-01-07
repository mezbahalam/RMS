class CandidateJob < ApplicationRecord
  belongs_to :candidate
  belongs_to :job

  validates :candidate_id, presence: true, uniqueness: { scope: :job_id }
  validates :job_id, presence: true
  validates :expected_salary, presence: true, numericality: true

  def job_applied?(candidateid, jobid)
    CandidateJob.exists?(candidate_id: candidateid, job_id: jobid)
  end
end
