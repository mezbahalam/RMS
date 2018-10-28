require 'rails_helper'
describe Candidate, type: :model do
  before{ Candidate.set_callback( :validation, :before, :remove_avatar)}
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:skill) }
  it { is_expected.to validate_presence_of(:experience) }
  it { is_expected.to validate_presence_of(:personal_interest) }

  it 'is invalid with a duplicate email' do
    create(:candidate)
    is_expected.to validate_uniqueness_of(:email)
  end

  it { is_expected.to define_enum_for(:gender).with([:male, :female])}
  it { is_expected.to validate_numericality_of(:experience) }

  describe 'scope' do
    let!(:candidate_one) do
      FactoryBot.create(:candidate,
                        experience: 4)
    end

    let!(:candidate_two) do
      FactoryBot.create(:candidate,
                        experience: 2)
    end

    subject { described_class.sorted }
    context 'sorted by experience in ASC order' do
      it { is_expected.to eq([candidate_two, candidate_one])}
    end
  end

  describe 'validations' do
    before(:each) do
      @candidate = Candidate.new(name: 'Sara',
                                 contact: '01792050217',
                                 email: 'somename@gmail.com',
                                 skill: 'c',
                                 experience: 1.5,
                                 personal_interest: 'reading')
    end

    describe 'when email format is invalid' do
      it 'should be invalid' do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          @candidate.email = invalid_address
          expect(@candidate).not_to be_valid
        end
      end
    end

    describe 'when email format is valid' do
      it 'should be valid' do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          @candidate.email = valid_address
          expect(@candidate).to be_valid
        end
      end
    end
  end
end
