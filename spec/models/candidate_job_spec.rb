require 'rails_helper'

RSpec.describe CandidateJob, type: :model do
  it { is_expected.to belong_to(:candidate) }
  it { is_expected.to belong_to(:job) }
  it { is_expected.to validate_presence_of(:candidate_id) }
  it { is_expected.to validate_presence_of(:job_id) }
  it { is_expected.to validate_uniqueness_of(:candidate_id).scoped_to(:job_id) }
  it { is_expected.to validate_presence_of(:expected_salary) }
  it { is_expected.to validate_numericality_of(:expected_salary) }

  let!(:first_user) do
    FactoryBot.create(:user, role: :applicant)
  end

  let!(:first_candidate) do
    FactoryBot.create(:candidate, user_id: first_user.id)
  end

  let!(:first_job) do
    FactoryBot.create(:job,
                      deadline: '2018-11-26'.to_date)
  end

  describe 'job_applied' do
    let!(:first_candidate_job) do
      FactoryBot.create(:candidate_job,
                        candidate_id: first_candidate.id,
                        job_id: first_job.id)
    end

    context 'if already' do
      it 'will return true' do
        expect(subject.job_applied?(first_candidate, first_job)).to be true
      end
    end
  end

  describe '#start_time' do
    it 'returns created_at from candidates_job' do
      second_candidate_job = create(:candidate_job, candidate_id: first_candidate.id, job_id: first_job.id)
      expect(second_candidate_job.start_time).to eq second_candidate_job.created_at
    end
  end

  describe '#end_time' do
    it 'returns deadline from jobs' do
      third_candidate_job = create(:candidate_job, candidate_id: first_candidate.id, job_id: first_job.id)
      expect(third_candidate_job.end_time).to eq first_job.deadline
    end
  end

  describe '#title' do
    it 'returns title from jobs' do
      another_candidate_job = create(:candidate_job, candidate_id: first_candidate.id, job_id: first_job.id)
      expect(another_candidate_job.title).to eq first_job.title
    end
  end
end
