require 'rails_helper'
RSpec.describe ApplicationController, type: :controller do
  let(:user) { FactoryBot.create(:user)}
  let(:another_user) do
    FactoryBot.create(:user,
                      firstname: 'Orin',
                      lastname: 'Tasnim',
                      contact: '01920512637',
                      dob: '1-11-2018',
                      email: 'orin@welldev.io',
                      password: '000000',
                      confirmation_token: 'token')
  end

  describe '#check_if_email_confirmed' do
    context 'when email is confirmed' do
      it 'returns nil' do
        expect(subject.check_if_email_confirmed).to be_nil
      end
    end

    context 'when email is not confirmed yet' do
      controller do
        def create
          render html: 'success'
        end
      end
      before do
        user.update(email_confirmed_at: nil)
      end

      it 'redirects to sign in path' do
        post :create
        expect(response).to redirect_to sign_in_path
      end
    end
  end
end
