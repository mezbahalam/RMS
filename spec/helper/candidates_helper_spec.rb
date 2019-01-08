require 'rails_helper'

RSpec.describe CandidatesHelper, type: :helper do
  let(:candidate) { FactoryBot.create(:candidate, dob: '12-12-1996'.to_date) }
  describe '#human_attribute_genders' do
    subject { human_attribute_genders }

    context 'prepares hash value for gender' do
      let(:candidate) do
        FactoryBot.create(:candidate)
      end
      let(:gender) do
        { 'female' => 'Female', 'male' => 'Male' }
      end
      it { is_expected.to eq(gender) }
    end
  end

  describe '#age' do
    context 'when date is valid' do
      it 'calculates the age' do
        dob = candidate.dob
        expect(age(dob)).to eql(22)
      end
    end

    context 'when date is invalid' do
      it 'will not calculate any age' do
        dob = nil
        expect(age(dob)).to be_nil
      end
    end
  end

  describe 'valid_age' do
    it 'when age is more than 15 years' do
      dob = candidate.dob
      expect(valid_age?(dob)).to be true
    end
  end
end
