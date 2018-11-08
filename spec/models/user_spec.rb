require 'rails_helper'
describe User, type: :model do

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:firstname) }
  it { is_expected.to validate_presence_of(:lastname) }
  it { is_expected.to validate_presence_of(:contact) }
  it { is_expected.to validate_presence_of :password }
  it { is_expected.to validate_numericality_of(:contact) }

  describe 'validations' do
    before(:each) do
      @user = User.new(firstname: 'Sara',
                       lastname: 'Tabassum' ,
                       contact: '01792050217',
                       email: 'somename@gmail.com',
                       password:'000000')
    end

    describe 'when email format is invalid' do
      it 'should be invalid' do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          @user.email = invalid_address
          expect(@user).not_to be_valid
        end
      end
    end

    describe 'when email format is valid' do
      it 'should be valid' do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          @user.email = valid_address
          expect(@user).to be_valid
        end
      end
    end

    context '#confirm_email' do
      let(:second_user) { FactoryBot.create(:user, email_confirmed_at: nil) }
      it 'sets email_confirmed_at value' do
        second_user.confirm_email
        expect(second_user.email_confirmed_at).to be_present
      end
    end

    describe '#forgot_password!' do
      it 'generates the confirmation token' do
        user = create(:user, confirmation_token: nil)
        user.forgot_password!
        expect(user.confirmation_token).not_to be_nil
      end
    end
  end
end
