require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  let!(:user) do
    FactoryBot.create(:user, role: :applicant, country: 'BD')
  end

  describe 'GET #new' do
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'on POST to #create' do
    context 'with valid attributes' do
      it 'creates user and sends confirmation email' do
        user_attributes = FactoryBot.attributes_for(:user)
        old_user_count = User.count
        post :create, params: {
            user: user_attributes,
        }

        expect(assigns(:user)).to be_present
        expect(User.count).to eq old_user_count + 1
        expect(ActionMailer::Base.deliveries).not_to be_empty
        expect(response).to redirect_to(Clearance.configuration.redirect_url)
      end
    end

    context 'with invalid attributes ' do
      let(:invalid_attributes) do
        {
            email: 'swakhar.me@gmail.com',
            first_name: nil,
            last_name: nil,
            password: nil
        }
      end
      it 'does not save new user in database' do
        expect do
          post :create, params: { user: invalid_attributes }
        end.not_to change(User, :count)
      end
      it 're-renders the :new template' do
        post :create, params: { user: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    before do
      sign_in_as user
    end
    context 'user profile incomplete details' do
      let(:valid_attributes) do
        attributes_for(:user,
                       first_name: 'KOL',
                       middle_name: '',
                       last_name: 'KOL',
                       email: 'KOL@gmail.com',
                       password: '000000',
                       confirmation_token: 'token',
                       email_confirmed_at: Time.now,
                       country: 'BD',
                       role: :applicant)
      end
      it 'locates the requested user' do
        patch :update, params: { id: user, user: valid_attributes }
        expect(assigns(:user)).to eq(user)
      end
    end
  end

  describe 'PATCH #update' do
    before do
      sign_in_as user
    end
    context 'user profile incomplete details' do
      let(:valid_attributes) do
        attributes_for(:user,
                       first_name: 'KOL',
                       middle_name: '',
                       last_name: 'KOL',
                       email: 'KOL@gmail.com',
                       password: '000000',
                       confirmation_token: 'token',
                       email_confirmed_at: Time.now,
                       country: 'BD',
                       role: :applicant)
      end

      it 'locates the requested user' do
        patch :update, params: { id: user,
                                 user: valid_attributes }
        expect(assigns(:user)).to eq(user)
      end

      it 'updates the new user in the database' do
        patch :update, params: { id: user,
                                 user: valid_attributes }
        expect(flash[:notice]).to eq("User profile updated successfully")
      end

      it 'redirects to the updated pages#index' do
        patch :update, params: { id: user,
                                 user: valid_attributes }
        expect(response).to redirect_to pages_path
      end
    end
  end
end
