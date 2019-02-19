require 'rails_helper'

RSpec.describe CandidateJob, type: :model do
  it { is_expected.to belong_to(:candidate) }
  it { is_expected.to belong_to(:job) }
  it { is_expected.to validate_presence_of(:candidate_id) }
  it { is_expected.to validate_presence_of(:job_id) }
  it { is_expected.to validate_uniqueness_of(:candidate_id).scoped_to(:job_id) }
  it { is_expected.to validate_presence_of(:expected_salary) }
  it { is_expected.to validate_numericality_of(:expected_salary) }

  let!(:user1) do
    FactoryBot.create(:user, role: :applicant)
  end

  let!(:candidate_one) do
    FactoryBot.create(:candidate, user_id: user1.id)
  end

  let!(:job_one) do
    FactoryBot.create(:job,
                      deadline: '2018-11-26'.to_date)
  end


  describe 'job_applied' do
    let!(:candidate_job_one) do
      FactoryBot.create(:candidate_job,
                        candidate_id: candidate_one.id,
                        job_id: job_one.id)
    end

    context 'if already' do
      it 'will return true' do
        expect(subject.job_applied?(candidate_one, job_one)).to be true
      end
    end
  end

  describe '#start_time' do
    it 'returns created_at from candidates_job' do
      candidate_job_two = create(:candidate_job, candidate_id: candidate_one.id, job_id: job_one.id)
      expect(candidate_job_two.start_time).to eq candidate_job_two.created_at
    end
  end

  describe '#end_time' do
    it 'returns deadline from jobs' do
      candidate_job_three = create(:candidate_job, candidate_id: candidate_one.id, job_id: job_one.id)
      expect(candidate_job_three.end_time).to eq job_one.deadline
    end
  end

  describe '#title' do
    it 'returns title from jobs' do
      candidate_job_four = create(:candidate_job, candidate_id: candidate_one.id, job_id: job_one.id)
      expect(candidate_job_four.title).to eq job_one.title
    end
  end
end
