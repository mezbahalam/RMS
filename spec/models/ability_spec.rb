require 'spec_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  let(:user) do
    FactoryBot.create(:user, role: :admin)
  end

  let(:job) do
    FactoryBot.create(:job,
                      title: 'junior_software_engineer',
                      description: 'work on rails',
                      deadline: '2018-11-28'.to_date)
  end

  describe 'Admin Abilities' do
    subject { described_class.new(user) }

    let(:candidate) { FactoryBot.create(:candidate, user_id: user.id) }

    let(:candidate_job) do
      FactoryBot.create(:candidate_job,
                        candidate_id: candidate.id,
                        job_id: job.id,
                        expected_salary: '20000')
    end

    context 'Manage all' do
      it { is_expected.to be_able_to(:manage, :all) }
    end

    context 'Candidate' do
      it { is_expected.not_to be_able_to(:create, candidate) }
      it { is_expected.not_to be_able_to(:edit, candidate) }
    end

    context 'Candidate Job' do
      it { is_expected.not_to be_able_to(:create, candidate_job) }
    end
  end

  describe 'Applicant Abilities' do
    let(:user) do
      FactoryBot.create(:user, role: :applicant)
    end

    let(:another_user) do
      FactoryBot.create(:user, role: :applicant)
    end

    let(:first_candidate) { FactoryBot.create(:candidate, user_id: user.id) }
    let(:second_candidate) { FactoryBot.create(:candidate, id: first_candidate.id + 1, user_id: another_user.id) }

    let(:candidate_job) do
      FactoryBot.build(:candidate_job,
                       job_id: job.id,
                       expected_salary: '40000')
    end

    let(:another_candidate_job) do
      FactoryBot.build(:candidate_job,
                       id: candidate_job.id,
                       candidate: second_candidate)
    end

    subject { described_class.new(user) }

    context 'Candidate' do
      it { is_expected.to be_able_to(:show, first_candidate) }
      it { is_expected.to be_able_to(:create, first_candidate) }
      it { is_expected.to be_able_to(:update, first_candidate) }
      it { is_expected.not_to be_able_to(:show, second_candidate) }
      it { is_expected.not_to be_able_to(:update, second_candidate) }
      it { is_expected.not_to be_able_to(:index, first_candidate) }
      it { is_expected.not_to be_able_to(:delete, first_candidate) }
    end

    context 'Job' do
      it { is_expected.not_to be_able_to(:manage, job) }
    end

    context 'Candidate Job' do
      it { is_expected.to be_able_to(:index, candidate_job) }
      it { is_expected.to be_able_to(:create, candidate_job) }
      it { is_expected.not_to be_able_to(:create, another_candidate_job) }
      it { is_expected.not_to be_able_to(:show, candidate_job) }
    end
  end
end
