require 'rails_helper'
RSpec.describe CandidatesController, type: :controller do
  let!(:sample_1) do
    create(:candidate,
           name: 'Faiza',
           gender: :female,
           dob: '2010-09-25'.to_date,
           email: 'tithi@yahoo.com',
           address: 'House 78, road 10, shahbag, dhaka',
           contact: '0175206968',
           skill: 'c++,c,#',
           experience: 1.5,
           personal_interest: 'reading',
           hobbies: 'shopping',
           long_term_plan: 'PM of BD',
           keywords: 'software, engineer',
           referrals: 'Anjum Ara Begum')
  end

  # describe 'GET #index' do
  #   let!(:sample_2) { create(:candidate,
  #                            name: 'Lamiya',
  #                            email: 'lamiya@gmail.com',
  #                            contact: '012345678977',
  #                            skill:'c,c++',
  #                            experience: 2.0,
  #                            personal_interest:'shopping' ) }
  #
  #   it 'populates an array of all candidates' do
  #     get :index
  #     expect(assigns(:candidates)).to match_array [sample_1, sample_2]
  #   end
  #
  #   it 'renders the :index template' do
  #     get :index
  #     expect(response).to render_template :index
  #   end
  # end
  #
  # describe 'GET #show' do
  #   it 'displays the requested candidate to @candidate' do
  #     get :show, params: { id: sample_1 }
  #     expect(assigns(:candidate)).to eq sample_1
  #   end
  #
  #   it 'renders the :show template' do
  #     get :show, params: { id: sample_1 }
  #     expect(response).to render_template :show
  #   end
  # end
  #
  # describe 'GET #new' do
  #   it 'assigns a new Candidate to @candidate' do
  #     get :new
  #     expect(assigns(:candidate)).to be_a_new(Candidate)
  #   end
  #
  #   it 'renders the :new template' do
  #     get :new
  #     expect(response).to render_template :new
  #   end
  # end
  #
  # describe 'POST #create' do
  #   context 'with valid attributes' do
  #     let(:valid_attributes) do
  #       attributes_for(:candidate,
  #                      name: 'Mariya',
  #                      gender: :female,
  #                      dob: '2008-06-16',
  #                      email: 'mariya@gmail.com',
  #                      address: 'House 52, road 13, banasree, dhaka',
  #                      contact: '01792780217',
  #                      skill: 'c++,c,java,ruby',
  #                      experience: 4,
  #                      personal_interest: 'travelling',
  #                      hobbies: 'shopping',
  #                      long_term_plan: 'MD',
  #                      keywords: 'software, engineer',
  #                      referrals: 'Raha')
  #     end
  #
  #     it 'saves the new candidate in the database' do
  #       expect {
  #         post :create, params: { candidate: valid_attributes }
  #       }.to change(Candidate, :count).by(1)
  #     end
  #
  #     it 'redirects to candidates#index' do
  #       post :create, params: { candidate: valid_attributes }
  #       expect(response).to redirect_to candidates_path
  #     end
  #   end
  #
  #   context 'with invalid attributes' do
  #     let(:invalid_attributes) do
  #       attributes_for(:candidate,
  #                      name: nil,
  #                      gender: :female,
  #                      dob: '2008-06-16',
  #                      email: nil,
  #                      address: 'House 52, road 13, banasree, dhaka',
  #                      contact: '01792780217',
  #                      skill: 'c++,c,java,ruby',
  #                      experience: 4,
  #                      personal_interest: 'travelling',
  #                      hobbies: 'shopping',
  #                      long_term_plan: 'MD',
  #                      keywords: 'software, engineer',
  #                      referrals: 'Raha')
  #     end
  #
  #     it 'does not save the new candidate in the database' do
  #       expect {
  #         post :create, params: { candidate: invalid_attributes }
  #       }.not_to change(Candidate, :count)
  #     end
  #
  #     it 'renders the :new template' do
  #       post :create, params: { candidate: invalid_attributes }
  #       expect(response).to render_template :new
  #     end
  #   end
  # end
  #
  # describe 'GET #edit' do
  #   it 'assigns the requested candidate to @candidate' do
  #     get :edit, params: { id: sample_1 }
  #     expect(assigns(:candidate)).to eq sample_1
  #   end
  #
  #   it 'renders the :edit template' do
  #     get :edit, params: { id: sample_1 }
  #     expect(response).to render_template :edit
  #   end
  # end
  #
  # describe 'PATCH #update' do
  #   context 'with valid attributes' do
  #     let(:valid_attributes) do
  #       attributes_for(:candidate,
  #                      name: 'Noshin',
  #                      dob: '2010-09-06'.to_date,
  #                      gender: 'female',
  #                      email: 'noshin@yahoo.com',
  #                      address: 'House 56, road 10, shahbag, dhaka',
  #                      contact: '0175205968',
  #                      skill: 'c++,c',
  #                      experience: 2,
  #                      personal_interest: 'reading',
  #                      hobbies: 'shopping',
  #                      long_term_plan: 'PM of BD',
  #                      keywords: 'software, engineer',
  #                      referrals: 'Anjum Ara')
  #     end
  #
  #     it 'locates the requested candidate' do
  #       patch :update, params: { id: sample_1,
  #                                candidate: valid_attributes }
  #       expect(assigns(:candidate)).to eq(sample_1)
  #     end
  #
  #     it 'updates the new candidate in the database' do
  #       patch :update, params: { id: sample_1,
  #                                candidate: valid_attributes }
  #       sample_1.reload
  #       expect(sample_1.name).to eq('Noshin')
  #       expect(sample_1.dob).to eq('2010-09-06'.to_date)
  #       expect(sample_1.reload.gender).to eq('female')
  #       expect(sample_1.email).to eq('noshin@yahoo.com')
  #       expect(sample_1.address).to eq('House 56, road 10, shahbag, dhaka')
  #       expect(sample_1.contact).to eq('0175205968')
  #       expect(sample_1.skill).to eq('c++,c')
  #       expect(sample_1.experience).to eq('2')
  #       expect(sample_1.personal_interest).to eq('reading')
  #       expect(sample_1.hobbies).to eq('shopping')
  #       expect(sample_1.long_term_plan).to eq('PM of BD')
  #       expect(sample_1.keywords).to eq('software, engineer')
  #       expect(sample_1.referrals).to eq('Anjum Ara')
  #     end
  #
  #     it 'redirects to the updated candidates#index' do
  #       patch :update, params: { id: sample_1,
  #                                candidate: valid_attributes }
  #       expect(response).to redirect_to candidates_path(sample_1)
  #     end
  #   end
  #
  #   context 'with invalid attributes' do
  #     let(:invalid_attributes) do
  #       attributes_for(:candidate,
  #                      name: nil,
  #                      dob: '2010-09-25'.to_date,
  #                      gender: 'female',
  #                      email: nil,
  #                      address: 'House 8, road 180, nagpur, dhaka',
  #                      contact: '01789658976',
  #                      skill: 'c++,c,c#,ruby,java',
  #                      experience: '3',
  #                      personal_interest: nil,
  #                      hobbies: 'shopping',
  #                      long_term_plan: 'CTO',
  #                      keywords: 'frontend',
  #                      referrals: 'Roksar')
  #     end
  #
  #     it 'does not update the new candidate' do
  #       patch :update, params: { id: sample_1,
  #                                candidate: invalid_attributes }
  #       sample_1.reload
  #       expect(sample_1.name).to eq('Faiza')
  #       expect(sample_1.dob).to eq('2010-09-25'.to_date)
  #       expect(sample_1.gender).to eq('female')
  #       expect(sample_1.email).to eq('tithi@yahoo.com')
  #       expect(sample_1.address).to eq('House 78, road 10, shahbag, dhaka')
  #       expect(sample_1.contact).to eq('0175206968')
  #       expect(sample_1.skill).to eq('c++,c,#')
  #       expect(sample_1.experience).to eq('1.5')
  #       expect(sample_1.personal_interest).to eq('reading')
  #       expect(sample_1.hobbies).to eq('shopping')
  #       expect(sample_1.long_term_plan).to eq('PM of BD')
  #       expect(sample_1.keywords).to eq('software, engineer')
  #       expect(sample_1.referrals).to eq('Anjum Ara Begum')
  #     end
  #
  #     it 're-renders the :edit template' do
  #       patch :update, params: { id: sample_1,
  #                                candidate: invalid_attributes }
  #       expect(response).to render_template :edit
  #     end
  #   end
  # end
  #
  # describe 'DELETE #destroy' do
  #   it 'deletes the candidate' do
  #     expect{ delete :destroy, params: { id: sample_1 }}.to change(Candidate, :count).by(-1)
  #   end
  #
  #   it 'redirects to candidates#index' do
  #     delete :destroy, params: { id: sample_1 }
  #     expect(response).to redirect_to candidates_path
  #   end
  # end
end
