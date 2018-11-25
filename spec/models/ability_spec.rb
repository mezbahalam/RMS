require 'spec_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  let(:user) do
    FactoryBot.create(:user, role: :admin)
  end
  let(:instance) { Ability.new(user) }

  subject { instance }

  describe 'when user is an Admin' do
    context 'is able to' do
      it { is_expected.to be_able_to(:manage, :all) }
    end

    context 'is not able to' do
      let(:candidate) { FactoryBot.create(:candidate, user_id: user.id) }
      it { is_expected.to_not be_able_to(:edit, candidate) }
      it { is_expected.to_not be_able_to(:create, candidate ) }
    end
  end

  describe 'when user is a Candidate' do
    let(:user) do
      FactoryBot.create(:user, role: :candidate)
    end
    context 'is able to' do
      let(:candidate) { FactoryBot.create(:candidate, user_id: user.id) }
      it { is_expected.to be_able_to(:show, candidate) }
      it { is_expected.to be_able_to(:create, candidate ) }
      it { is_expected.to be_able_to(:update, candidate ) }
    end

    context 'is not able to' do
      let(:candidate) { FactoryBot.create(:candidate, user_id: user.id) }
      it { is_expected.to_not be_able_to(:index, candidate) }
      it { is_expected.to_not be_able_to(:delete, candidate ) }
    end
  end
end
