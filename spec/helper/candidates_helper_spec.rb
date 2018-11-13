require 'rails_helper'

RSpec.describe CandidatesHelper, type: :helper do
  describe '#human_attribute_genders' do
    subject { human_attribute_genders }

    context 'prepares hash value for gender' do
      let(:candidate) do
        FactoryBot.create(:candidate)
      end
      let(:gender) do
        {
         'female' => 'Female',
         'male' => 'Male'
        }
      end
      it { is_expected.to eq(gender) }
    end
  end
end
