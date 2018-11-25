require 'rails_helper'
RSpec.describe CandidatesController, type: :controller do
  let!(:user) do
    create(:user,
           first_name: 'Laila',
           last_name: 'Nushrat',
           email: 'laila1@gmail.com',
           password: '000000',
           confirmation_token: 'token',
           email_confirmed_at: Time.now,
           role: :candidate)
  end
  let!(:user_1) do
    create(:user,
           first_name: 'Harry',
           last_name: 'Potter',
           email: 'harry@gmail.com',
           password: '000000',
           confirmation_token: 'token',
           email_confirmed_at: Time.now,
           role: :admin)
  end
  let!(:candidate_1) do
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
           referrals: 'Anjum Ara Begum',
           user_id: user.id)
  end

  describe '#check_if_email_confirmed' do
    context 'when email is not confirmed yet' do
      before do
        user.update(email_confirmed_at: nil)
        sign_in_as user
      end

      it 'redirects to sign in path' do
        post :create
        expect(response).to redirect_to sign_in_path
      end
    end
  end

  before do
    sign_in_as user
  end

  describe 'GET #index' do
    before do
      sign_in_as user_1
    end
    let!(:candidate_2) { FactoryBot.create(:candidate, user_id: user_1.id) }

    it 'populates an array of all candidates' do
      get :index, params: { id: candidate_1 }
      expect(assigns(:candidates)).to match_array [candidate_1, candidate_2]
    end

    it 'renders to sign in path template' do
      sign_out
      get :index, params: { user_id: user.id }
      expect(response).to redirect_to sign_in_path
    end
  end

  describe 'GET #show' do
    it 'displays the requested candidate to @candidate' do
      get :show, params: { id: candidate_1 }
      expect(assigns(:candidate)).to eq candidate_1
    end

    it 'renders the :show template' do
      get :show, params: { id: candidate_1 }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new Candidate to @candidate' do
      get :new
      expect(assigns(:candidate)).to be_a_new(Candidate)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let!(:user_3) do
      create(:user,
             first_name: 'Saila',
             last_name: 'Annie',
             email: 'ishrat123@gmail.com',
             password: '000000',
             confirmation_token: 'token',
             email_confirmed_at: Time.now,
             role: :candidate)
    end

     before do
       sign_in_as user_3
     end

    context 'with valid attributes' do
      let(:valid_attributes) do
        attributes_for(:candidate,
                       name: 'Mariya',
                       gender: :female,
                       dob: '2008-06-16',
                       email: 'mariya@gmail.com',
                       address: 'House 52, road 13, banasree, dhaka',
                       contact: '01792780217',
                       skill: 'c++,c,java,ruby',
                       experience: 4,
                       personal_interest: 'travelling',
                       hobbies: 'shopping',
                       long_term_plan: 'MD',
                       keywords: 'software, engineer',
                       referrals: 'Raha',
                       user_id: user_3.id)
      end

      it 'saves the new candidate in the database' do
        expect {
          post :create, params: { candidate: valid_attributes,
                                  user_id: user_3.id }
        }.to change(Candidate, :count).by(1)
      end

      it 'redirects to pages#index' do
        post :create, params: { candidate: valid_attributes,
                                user_id: user_3.id }
        expect(response).to redirect_to pages_path
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        attributes_for(:candidate,
                       name: nil,
                       email: nil )
      end

      it 'does not save the new candidate in the database' do
        expect {
          post :create, params: { candidate: invalid_attributes }
        }.not_to change(Candidate, :count)
      end

      it 'renders the :new template' do
        post :create, params: { candidate: invalid_attributes }
        expect(response).to render_template :new
      end
    end

  end

  describe 'GET #edit' do
    it 'assigns the requested candidate to @candidate' do
      get :edit, params: { id: candidate_1 }
      expect(assigns(:candidate)).to eq candidate_1
    end

    it 'renders the :edit template' do
      get :edit, params: { id: candidate_1 }
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        attributes_for(:candidate,
                       name: 'Noshin',
                       dob: '2010-09-06'.to_date,
                       gender: 'female',
                       email: 'noshin@yahoo.com',
                       address: 'House 56, road 10, shahbag, dhaka',
                       contact: '0175205968',
                       skill: 'c++,c',
                       experience: 2,
                       personal_interest: 'reading',
                       hobbies: 'shopping',
                       long_term_plan: 'PM of BD',
                       keywords: 'software, engineer',
                       referrals: 'Anjum Ara',
                       user_id: user.id)
      end

      it 'locates the requested candidate' do
        patch :update, params: { id: candidate_1,
                                 candidate: valid_attributes }
        expect(assigns(:candidate)).to eq(candidate_1)
      end

      it 'updates the new candidate in the database' do
        patch :update, params: { id: candidate_1,
                                 candidate: valid_attributes }
        candidate_1.reload
        expect(candidate_1.name).to eq('Noshin')
        expect(candidate_1.dob).to eq('2010-09-06'.to_date)
        expect(candidate_1.reload.gender).to eq('female')
        expect(candidate_1.email).to eq('noshin@yahoo.com')
        expect(candidate_1.address).to eq('House 56, road 10, shahbag, dhaka')
        expect(candidate_1.contact).to eq('0175205968')
        expect(candidate_1.skill).to eq('c++,c')
        expect(candidate_1.experience).to eq(2)
        expect(candidate_1.personal_interest).to eq('reading')
        expect(candidate_1.hobbies).to eq('shopping')
        expect(candidate_1.long_term_plan).to eq('PM of BD')
        expect(candidate_1.keywords).to eq('software, engineer')
        expect(candidate_1.referrals).to eq('Anjum Ara')
      end

      it 'redirects to the updated pages#index' do
        patch :update, params: { id: candidate_1,
                                 candidate: valid_attributes }
        expect(response).to redirect_to pages_path
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        attributes_for(:candidate,
                       name: nil,
                       dob: '2010-09-25'.to_date,
                       gender: 'female',
                       email: nil,
                       address: 'House 8, road 180, nagpur, dhaka',
                       contact: '01789658976fgffffg',
                       skill: 'c++,c,c#,ruby,java',
                       experience: 3,
                       personal_interest: nil,
                       hobbies: 'shopping',
                       long_term_plan: 'CTO',
                       keywords: 'frontend',
                       referrals: 'Roksar')
      end

      it 'does not update the new candidate' do
        patch :update, params: { id: candidate_1,
                                 candidate: invalid_attributes }
        expect(flash[:error]).to eq("Name can't be blank, Email can't be blank, Email is invalid, Personal interest can't be blank, and Contact is not a number")
      end

      it 're-renders the :edit template' do
        patch :update, params: { id: candidate_1,
                                 candidate: invalid_attributes }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      sign_in_as user_1
    end
    it 'deletes the candidate' do
      expect{ delete :destroy, params: { id: candidate_1 }}.to change(Candidate, :count).by(-1)
    end

    it 'redirects to candidates#index' do
      delete :destroy, params: { id: candidate_1 }
      expect(response).to redirect_to candidates_path
    end
  end
end
