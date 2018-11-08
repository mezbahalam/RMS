require 'rails_helper'
RSpec.describe EmailConfirmationsController, type: :controller do
  let!(:user) { FactoryBot.create(:user)}
  describe '#confirm' do
    context 'with valid confirmation token' do
      before do
        get :confirm, params: { id: user.id, token: user.confirmation_token }
      end

      it 'update email_confirmed_at field and confirmation token' do
        expect(user.reload.email_confirmed_at).not_to be_nil
      end

      it 'confirmation token set to be an empty string' do
        expect(user.reload.confirmation_token).to be_nil
      end

      it 'redirects to sign in path' do
        user.reload
        expect(response).to redirect_to sign_in_path
      end
    end
  end
end
