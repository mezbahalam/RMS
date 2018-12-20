require 'rails_helper'

RSpec.describe CandidateJob, type: :model do
  it { is_expected.to belong_to(:candidate) }
  it { is_expected.to belong_to(:job) }
  it { is_expected.to validate_presence_of(:candidate_id) }
  it { is_expected.to validate_presence_of(:job_id) }
  it { is_expected.to validate_uniqueness_of(:candidate_id).scoped_to(:job_id) }
  it { is_expected.to validate_presence_of(:expected_salary) }
  it { is_expected.to validate_numericality_of(:expected_salary) }

  describe 'job_applied' do
    let!(:user1) do
      FactoryBot.create(:user, role: :applicant)
    end

    let!(:candidate_one) do
      FactoryBot.create(:candidate,
                        experience: 4.5,
                        user_id: user1.id)
    end

    let!(:job_one) do
      FactoryBot.create(:job,
                        deadline: '2018-11-26'.to_date)
    end

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
end
