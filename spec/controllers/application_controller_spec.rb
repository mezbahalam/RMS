require 'rails_helper'
RSpec.describe ApplicationController, type: :controller do
  let!(:user) do
    FactoryBot.create(:user,
           country: 'BD',
           role: :applicant)
  end

  let!(:user_1) do
    FactoryBot.create(:user, role: :applicant)
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
