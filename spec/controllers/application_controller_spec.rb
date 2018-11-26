require 'rails_helper'
RSpec.describe ApplicationController, type: :controller do
  let!(:user) do
    create(:user,
           first_name: 'Laila',
           last_name: 'Nushrat',
           email: 'laila1@gmail.com',
           password: '000000',
           confirmation_token: 'token',
           email_confirmed_at: Time.now,
           country: 'BD',
           role: :applicant)
  end

  let!(:user_1) do
    create(:user,
           first_name: 'Mary',
           last_name: 'Kom',
           email: 'mary@gmail.com',
           password: '000000',
           confirmation_token: 'token',
           email_confirmed_at: Time.now,
           role: :applicant)
  end

  describe '#check_if_profile_filled' do
    context 'if current user profile is filled' do
      it 'it returns the current user' do
        sign_in_as user
        expect(subject.check_if_profile_filled?).to be_nil
      end
    end

    context 'if current user profile is not filled' do
      controller do
        def index
          render html: 'success'
        end
      end

      before do
        sign_in_as user_1
        user_1.update(country: '')
      end

      it 'is redirected to the edit user page ' do
        get :index, params: { id: user_1 }
        expect(response).to redirect_to edit_user_path(user_1)
      end
    end
  end
end
