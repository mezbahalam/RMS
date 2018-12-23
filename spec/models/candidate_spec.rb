require 'rails_helper'
RSpec.describe Candidate, type: :model do
  before{ Candidate.set_callback( :validation, :before, :delete_avatar)}
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:cgpa) }
  it { is_expected.to validate_presence_of(:passing_year) }
  it { is_expected.to validate_presence_of(:skill) }
  it { is_expected.to validate_presence_of(:experience) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:personal_interest) }
  it { is_expected.to define_enum_for(:gender).with([:male, :female])}
  it { is_expected.to validate_numericality_of(:experience) }

  let!(:user1) do
    FactoryBot.create(:user, role: :applicant)
  end

  let!(:user2) do
    FactoryBot.create(:user, role: :applicant)
  end

  let!(:candidate_one) do
    FactoryBot.create(:candidate,
                      experience: 4.5,
                      user_id: user1.id)
  end

  let!(:candidate_two) do
    FactoryBot.create(:candidate,
                      experience: 2,
                      user_id: user2.id)
  end

  describe 'user id duplication' do
    it 'is invalid' do
      is_expected.to validate_uniqueness_of(:user_id)
    end
  end

  describe 'email duplication' do
    it 'is invalid' do
      is_expected.to validate_uniqueness_of(:email)
    end
  end


  describe 'scope' do
    subject { described_class.sorted }
    context 'sorted by experience in ASC order' do
      it { is_expected.to eq([candidate_two, candidate_one])}
    end
  end

  describe 'validations' do
    let!(:user) do
      FactoryBot.create(:user, role: :applicant)
    end

    before(:each) do
      @candidate = Candidate.new(name: 'Sara',
                                 contact: '01792050217',
                                 email: 'somename@gmail.com',
                                 cgpa: 2.96,
                                 passing_year: '2016',
                                 skill: 'c',
                                 experience: 1.5,
                                 personal_interest: 'reading',
                                 user_id: user.id)
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
