require 'spec_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  let(:instance) { Ability.new(user) }
  subject { instance }

  describe 'Abilities' do
    let(:user) do
      FactoryBot.create(:user, role: :admin)
    end

    let(:candidate) { FactoryBot.create(:candidate, user_id: user.id) }

    let(:job) do
      FactoryBot.create(:job,
                        title: 'junior_software_engineer',
                        description: 'work on rails',
                        deadline: '2018-11-28'.to_date)
    end

    let(:candidate_job) do
      FactoryBot.create(:candidate_job,
                        candidate_id: candidate.id,
                        job_id: job.id,
                        expected_salary: '20000')
    end
    context 'Admin Abilities' do
      it 'admin can manage all' do
        is_expected.to be_able_to(:manage, :all)
      end
      it 'cannot be able to create, edit an existing candidate' do
        is_expected.not_to be_able_to(:create, candidate)
        is_expected.not_to be_able_to(:edit, candidate)
      end

      it 'cannot apply for any job posts' do
        is_expected.not_to be_able_to(:create, candidate_job)
      end
    end

    context 'Applicant Abilities' do
      let(:user) do
        FactoryBot.create(:user, role: :applicant)
      end

      let(:candidate1) { FactoryBot.create(:candidate, user_id: user.id) }

      let(:candidate_job) do
        FactoryBot.build(:candidate_job, expected_salary: '40000')
      end

      let(:another_candidate_job) do
        FactoryBot.build(:candidate_job,
                          candidate_id: candidate1.id,
                          job_id: job.id,
                          expected_salary: '20000')
      end

      it 'Applicant can create, edit, and view details of ones profile' do
        is_expected.to be_able_to(:show, candidate1)
        is_expected.to be_able_to(:create, candidate1)
        is_expected.to be_able_to(:update, candidate1)
      end

      it 'cannot be able to view the candidate list and delete an existing candidate' do
        is_expected.not_to be_able_to(:index, candidate1)
        is_expected.not_to be_able_to(:delete, candidate1)
      end

      it 'can see all the jobs in the homepage' do
        is_expected.to be_able_to(:index, candidate_job)
      end

      it 'can be able to apply for job posts' do
        is_expected.to be_able_to(:create, candidate_job)
      end

      it 'cannot posts job in behalf of another applicant' do
        is_expected.not_to be_able_to(:create, another_candidate_job)
      end

      it 'cannot see applicants who have applied for jobs' do
        is_expected.not_to be_able_to(:show, candidate_job)
      end

      it 'cannot manipulate job model' do
        is_expected.not_to be_able_to(:manage, job)
      end
    end
  end
end
