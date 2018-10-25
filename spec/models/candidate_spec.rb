require 'rails_helper'
describe Candidate, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:skill) }
  it { is_expected.to validate_presence_of(:experience) }
  it { is_expected.to validate_presence_of(:personal_interest) }
  it 'is invalid with a duplicate email' do
    create(:candidate)
    is_expected.to validate_uniqueness_of(:email)
  end
  it { is_expected.to validate_numericality_of(:experience) }
end
