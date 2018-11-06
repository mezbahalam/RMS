require 'rails_helper'
RSpec.describe EmailConfirmationsController, type: :controller do
  let!(:user) { FactoryBot.create(:user,
                                  firstname: 'Laila',
                                  lastname: 'Nushrat',
                                  contact: '0172050217',
                                  dob: '17-08-1994',
                                  email: 'laila1@gmail.com',
                                  password: '000000',
                                  confirmation_token: 'token',
                                  email_confirmed_at: Time.now) }
  describe '#confirm' do
    context 'with valid confirmation token' do
      before do
        get :confirm, params: { user_id: @user.id }
      end

      it 'update email_confirmed_at field' do
        expect(user.reload.email_confirmed_at).not_to be_nil
      end

      it 'confirmation token set to be an empty string' do
        expect(user.reload.confirmation_token).to eq('')
      end

      it 'redirects to sign in path' do
        user.reload
        expect(response).to redirect_to sign_in_path
      end
    end
  end
end
