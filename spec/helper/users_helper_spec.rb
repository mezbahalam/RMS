require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  describe '#human_attribute_roles' do
    subject { human_attribute_roles }

    context 'prepares hash value for role' do
      let(:user) do
        FactoryBot.create(:user)
      end
      let(:role) do
        {
            'admin' => 'Admin',
            'applicant' => 'Applicant'
        }
      end
      it { is_expected.to eq(role) }
    end
  end
end
