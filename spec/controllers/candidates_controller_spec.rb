require 'rails_helper'
RSpec.describe CandidatesController, type: :controller do
  let!(:user) { FactoryBot.create(:user, role: :applicant) }
  let!(:user_1) { FactoryBot.create(:user, role: :admin) }
  let!(:candidate_1) { FactoryBot.create(:candidate) }

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
    let!(:candidate_2) { FactoryBot.create(:candidate) }

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
    let!(:user_3) { FactoryBot.create(:user, role: :applicant) }

     before do
       sign_in_as user_3
     end

    context 'with valid attributes' do
      let(:valid_attributes) do
        FactoryBot.attributes_for(:candidate)
      end

      it 'saves the new candidate in the database and gives a flash message' do
        expect {
          post :create, params: { candidate: valid_attributes, user_id: user_3.id }
        }.to change(Candidate, :count).by(1)
        expect(flash[:notice]).to eq("Record of 'Nushrat Raha' created successfully!")
      end

      it 'redirects to pages#index' do
        post :create, params: { candidate: valid_attributes, user_id: user_3.id }
        expect(response).to redirect_to pages_path
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        FactoryBot.attributes_for(:candidate,
                                  name: nil,
                                  email: nil )
      end

      it 'does not save the new candidate in the database' do
        expect {
          post :create, params: { candidate: invalid_attributes }
        }.not_to change(Candidate, :count)
        expect(flash[:error]).to eq("Name can't be blank, Email can't be blank, and Email is invalid")
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
        FactoryBot.attributes_for(:candidate, contact: '0177789652')
      end

      it 'locates the requested candidate' do
        patch :update, params: { id: candidate_1, candidate: valid_attributes }
        expect(assigns(:candidate)).to eq(candidate_1)
      end

      it 'updates the new candidate in the database' do
        patch :update, params: { id: candidate_1, candidate: valid_attributes }
        candidate_1.reload
        expect(candidate_1.contact).to eq('0177789652')
      end

      it 'gives a flash message' do
        patch :update, params: { id: candidate_1, candidate: valid_attributes }
        expect(flash[:notice]).to eq("Record of 'Nushrat Raha' updated successfully!")
      end


      it 'redirects to the updated pages#index' do
        patch :update, params: { id: candidate_1, candidate: valid_attributes }
        expect(response).to redirect_to pages_path
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        FactoryBot.attributes_for(:candidate,
                       name: nil,
                       email: nil,
                       contact: '01789658976fgffffg',
                       personal_interest: nil)
      end

      it 'does not update the new candidate' do
        patch :update, params: { id: candidate_1, candidate: invalid_attributes }
        expect(flash[:error]).to eq("Name can't be blank, Email can't be blank, Email is invalid, Personal interest can't be blank, and Contact is not a number")
      end

      it 're-renders the :edit template' do
        patch :update, params: { id: candidate_1, candidate: invalid_attributes }
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
