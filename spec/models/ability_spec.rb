require 'spec_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  let(:user) do
    FactoryBot.create(:user, role: :admin)
  end

  let(:candidate) { FactoryBot.create(:candidate, user_id: user.id) }
  let(:job) { FactoryBot.create(:job, title: 'junior_software_engineer',
                                  description: 'work on rails',
                                  deadline: '2018-11-28'.to_date) }
  let(:instance) { Ability.new(user) }
  subject { instance }

  describe 'Abilities' do
    context 'Admin Abilities' do
      it 'admin can manage all' do
        is_expected.to be_able_to(:manage, :all)
      end
      it 'should not able to create and edit an existing candidate' do
        is_expected.not_to be_able_to(:create, candidate)
        is_expected.not_to be_able_to(:edit, candidate)
      end
    end

    context 'Applicant Abilities' do
      let(:user) do
        FactoryBot.create(:user, role: :applicant)
      end

      it 'Applicant can create, edit, and view details of ones profile' do
        is_expected.to be_able_to(:show, candidate)
        is_expected.to be_able_to(:create, candidate)
        is_expected.to be_able_to(:update, candidate)
      end
      it 'should not able to view the candidate list, delete an existing candidate and cannot manipulate job model' do
        is_expected.not_to be_able_to(:index, candidate)
        is_expected.not_to be_able_to(:delete, candidate)
        is_expected.not_to be_able_to(:manage, job)
      end
    end
  end
end
