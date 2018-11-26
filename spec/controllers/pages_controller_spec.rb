require 'rails_helper'
RSpec.describe PagesController, type: :controller do
  let!(:user) do
    create(:user,
           first_name: 'Saila',
           last_name: 'Annie',
           email: 'ishrat@gmail.com',
           password: '000000',
           confirmation_token: 'token',
           email_confirmed_at: Time.now,
           country: 'BD',
           role: :admin)
  end

  let!(:user_1) do
    create(:user,
           first_name: 'Sarila',
           last_name: 'polo',
           email: 'ishro123@gmail.com',
           password: '000000',
           confirmation_token: 'token',
           email_confirmed_at: Time.now,
           country: 'BD',
           role: :applicant)
  end

  let!(:user_2) do
    create(:user,
           first_name: 'Sarfaraz',
           last_name: 'ahmed',
           email: 'ahmed123@gmail.com',
           password: '000000',
           confirmation_token: 'token',
           email_confirmed_at: Time.now,
           country: 'BD',
           role: :applicant)
  end

  let!(:candidate) do
    create(:candidate,
           name: 'Fa',
           gender: :female,
           dob: '2010-09-25'.to_date,
           email: 'ti@yahoo.com',
           address: 'House 78, road 10, shahbag, dhaka',
           contact: '01752968',
           skill: 'c++,c,#',
           experience: 1.5,
           personal_interest: 'reading',
           hobbies: 'shopping',
           long_term_plan: 'PM of BD',
           keywords: 'software, engineer',
           referrals: 'Anjum Ara Begum',
           user_id: user_1.id)
  end

  describe 'GET #index' do
    context 'when user is an admin' do
      it 'redirects to candidates#index' do
        sign_in_as user
        get :index
        expect(response).to redirect_to candidates_path
      end
    end

    context 'when user is a candidate' do
      context 'and already has a profile created' do
        it 'will render the index template' do
          sign_in_as user_1
          get :index, params: { id: candidate }
          expect(response).to render_template :index
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
