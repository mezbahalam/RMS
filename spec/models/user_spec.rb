require 'rails_helper'
RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of (:password)}
  it { is_expected.to define_enum_for(:role).with([:admin, :applicant])}

  describe 'validations' do
    before(:each) do
      @user = User.new(first_name: 'Sara',
                       last_name: 'Tabassum' ,
                       email: 'somename@gmail.com',
                       password:'000000',
                       role: :applicant)
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
        second_user.set_confirm_email
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

    describe '#profile_filled?' do
      it 'checks if all info is filled when user is created' do
      user = create(:user)
      user.profile_filled?
      expect(user.country).not_to be_nil
      end
    end
  end
end
