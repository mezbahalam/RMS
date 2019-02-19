class CandidateJob < ApplicationRecord
  COLORS = { junior_software_engineer: 'junior-engineer', front_end_engineer: 'front-engineer', senior_software_engineer: 'senior-engineer' }
  belongs_to :candidate
  belongs_to :job

  validates :candidate_id, presence: true, uniqueness: { scope: :job_id }
  validates :job_id, presence: true
  validates :expected_salary, presence: true, numericality: true

  def job_applied?(candidateid, jobid)
    CandidateJob.exists?(candidate_id: candidateid, job_id: jobid)
  end

  def start_time
    created_at
  end

  def end_time
    Job.find(job_id).deadline
  end

  def title
    Job.find(job_id).title
  end

end
