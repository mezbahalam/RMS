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

  it 'has the correct format' do
    expect(subject).to allow_value(FFaker::Internet.email).for(:email)
    expect(subject).to_not allow_value("'#{FFaker::Internet.email}'").for(:email)
  end

  it { is_expected.to validate_numericality_of(:experience) }

  it 'applies a scope to collections by experience ascending' do
    expect(Candidate.all.order(experience: :asc).to_sql).to eq (Candidate.all.order(experience: :asc).to_sql)
  end

  it { is_expected.to define_enum_for(:gender).with([:male, :female])}

  it 'deletes the file' do
    expect(:avatar).to receive(:delete_avatar).with('test/status.txt')
  end
end
