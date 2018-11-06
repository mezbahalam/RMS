require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  let!(:user) do
    create(:user,
           firstname: 'Saila',
           lastname: 'Annie',
           contact: '0172050217',
           dob: '14-10-1990',
           email: 'ishrat@gmail.com',
           password: '000000',
           confirmation_token: 'token',
           email_confirmed_at: Time.now )
  end

  describe 'GET #new' do
    subject { get :new }

    it 'renders the :new template' do
      subject
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
            firstname: nil,
            lastname: nil,
            contact: '01796325584',
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
end
