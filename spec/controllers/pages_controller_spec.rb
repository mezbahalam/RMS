require 'rails_helper'
RSpec.describe PagesController, type: :controller do
  let!(:user) do
    FactoryBot.create(:user, role: :admin)
  end

  let!(:user_1) do
    FactoryBot.create(:user, role: :applicant)
  end

  let!(:user_2) do
    FactoryBot.create(:user, role: :applicant)
  end

  let!(:candidate) do
    FactoryBot.create(:candidate, user_id: user_1.id)
  end

  describe 'GET #index' do
    context 'when user is an admin' do
      it 'redirects to admins#index' do
        sign_in_as user
        get :index
        expect(response).to redirect_to admins_path
      end
    end

    context 'when user is a candidate' do
      context 'and already has a profile created' do
        it 'will redirect to candidate jobs path' do
          sign_in_as user_1
          get :index, params: { id: candidate }
          expect(response).to redirect_to candidate_jobs_path
        end
      end

      context 'and has no profile created' do
        it 'user will be redirected to candidate new page for profile creation' do
          sign_in_as user_2
          get :index
          expect(response).to redirect_to new_candidate_path
        end
      end
    end
  end
end
