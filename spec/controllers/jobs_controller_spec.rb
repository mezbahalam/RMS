require 'rails_helper'
RSpec.describe JobsController, type: :controller do
  let!(:user) do
    FactoryBot.create(:user,
           first_name: 'first',
           last_name: 'last',
           contact: '123456789',
           dob: '14-11-2018',
           email: 'email@abc.com',
           password: 'abcde',
           confirmation_token: 'token',
           email_confirmed_at: Time.now)
  end
  let!(:job_1) do
    FactoryBot.create(:job,
           title: 'junior_software_engineer',
           description: 'work with rails',
           deadline: '2018-11-25'.to_date)
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
    let!(:job_2) do
      FactoryBot.create(:job,
             title: 'junior_software_engineer')
    end

    it 'populates an array of all jobs' do
      get :index
      expect(assigns(:jobs)).to match_array [job_1, job_2]
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'displays the requested job to @job' do
      get :show, params: { id: job_1 }
      expect(assigns :job).to eq job_1
    end

    it 'renders the :show template' do
      get :show, params: { id: job_1 }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new Job to @job' do
      get :new
      expect(assigns :job).to be_a_new(Job)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        attributes_for(:job,
                       title: 'junior_software_engineer',
                       description: 'work with rails',
                       deadline: '2018-11-25'.to_date)
      end

      it 'saves the new job in the database' do
        expect do
          post :create, params: { job: valid_attributes }
        end.to change(Job, :count).by(1)
      end

      it 'redirects to jobs#index' do
        post :create, params: { job: valid_attributes }
        expect(response).to redirect_to jobs_path
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        attributes_for(:candidate,
                       title: nil,
                       description: 'work with rails',
                       deadline: '2018-11-25'.to_date)
      end

      it 'does not save the new job in the database' do
        expect do
          post :create, params: { job: invalid_attributes }
        end.not_to change(Job, :count)
      end

      it 'renders the :new template' do
        post :create, params: { job: invalid_attributes }
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested job to @job' do
      get :edit, params: { id: job_1 }
      expect(assigns :job).to eq job_1
    end

    it 'renders the :edit template' do
      get :edit, params: { id: job_1 }
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        attributes_for(:job,
                       title: 'junior_software_engineer',
                       description: 'work in rails',
                       deadline: '2018-11-25'.to_date)
      end

      it 'locates the requested job' do
        patch :update, params: { id: job_1, job: valid_attributes }
        expect(assigns(:job)).to eq(job_1)
      end

      it 'updates the new job in the database' do
        put :update, params: { id: job_1.id, job: valid_attributes }
        job_1.reload
        expect(job_1.title).to eq('junior_software_engineer')
        expect(job_1.description).to eq('work in rails')
        expect(job_1.deadline).to eq('2018-11-25'.to_date)
      end

      it 'redirects to the updated jobs#index' do
        patch :update, params: { id: job_1, job: valid_attributes }
        expect(response).to redirect_to jobs_path
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        attributes_for(:job,
                       title: nil,
                       description: 'work in rails',
                       deadline: '2018-12-08'.to_date)
      end

      it 'does not update the new job' do
        patch :update, params: { id: job_1, job: invalid_attributes }
        job_1.reload
        expect(job_1.title).to eq('junior_software_engineer')
        expect(job_1.description).to eq('work with rails')
        expect(job_1.deadline).to eq('2018-11-25'.to_date)
      end

      it 're-renders the :edit template' do
        patch :update, params: { id: job_1, job: invalid_attributes }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the job' do
      expect{ delete :destroy, params: { id: job_1 }}.to change(Job, :count).by(-1)
    end

    it 'redirects to jobs#index' do
      delete :destroy, params: { id: job_1 }
      expect(response).to redirect_to jobs_path
    end
  end
end
