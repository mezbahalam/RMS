require 'rails_helper'
RSpec.describe JobsController, type: :controller do
  let!(:user) do
    create(:user,
           first_name: 'rajib',
           last_name: 'das',
           contact: '123456789',
           dob: '14-11-2018',
           email: 'rajib@abc.com',
           password: 'rajib',
           confirmation_token: 'token',
           email_confirmed_at: Time.now)
  end
  let!(:sample_1) do
    create(:job,
           title: 'junior_software_engineer',
           vacancy: 5,
           job_description: 'work with rails',
           responsibilities: 'development',
           employment_status: 'full_time',
           edu_requirement: 'bsc in cse',
           exp_requirement: 1,
           location: 'dhaka',
           remuneration: 40000,
           benefits: 'yearly_bonus',
           date_issue: '2018-11-08'.to_date,
           deadline: '2018-12-08'.to_date,
           job_status: 'Open')
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
    let!(:sample_2) { create(:job, title: 'junior_software_engineer') }

    it 'populates an array of all jobs' do
      get :index
      expect(assigns(:jobs)).to match_array [sample_1, sample_2]
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'displays the requested job to @job' do
      get :show, params: { id: sample_1 }
      expect(assigns :job).to eq sample_1
    end

    it 'renders the :show template' do
      get :show, params: { id: sample_1 }
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
                       vacancy: 5,
                       job_description: 'work with rails',
                       responsibilities: 'lots of work',
                       employment_status: 'full_time',
                       edu_requirement: 'bsc in cse',
                       exp_requirement: 15,
                       location: 'dhaka',
                       remuneration: 46546554,
                       benefits: 'nothing',
                       date_issue: '2018-11-08'.to_date,
                       deadline: '2018-11-08'.to_date,
                       job_status: 'open')
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
                       vacancy: 4,
                       job_description: 'work with rails',
                       responsibilities: 'lots of work',
                       employment_status: 'full_time',
                       edu_requirement: 'bsc in cse',
                       exp_requirement: 15,
                       location: 'dhaka',
                       remuneration: 46546554,
                       benefits: 'nothing',
                       date_issue: '2018-11-08'.to_date,
                       deadline: '2018-11-08'.to_date,
                       job_status: 'open')
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
      get :edit, params: { id: sample_1 }
      expect(assigns :job).to eq sample_1
    end

    it 'renders the :edit template' do
      get :edit, params: { id: sample_1 }
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        attributes_for(:job,
                       title: 'junior_software_engineer',
                       vacancy: 5,
                       job_description: 'work in rails',
                       responsibilities: 'development',
                       employment_status: 'full_time',
                       edu_requirement: 'bsc in cse',
                       exp_requirement: 1,
                       location: 'dhaka',
                       remuneration: 40000,
                       benefits: 'yearly_bonus',
                       date_issue: '2018-11-08'.to_date,
                       deadline: '2018-12-08'.to_date,
                       job_status: 'Open')
      end

      it 'locates the requested job' do
        patch :update, params: { id: sample_1, job: valid_attributes }
        expect(assigns(:job)).to eq(sample_1)
      end

      it 'updates the new job in the database' do
        patch :update, params: { id: sample_1, job: valid_attributes }
        sample_1.reload
        expect(sample_1.title).to eq('junior_software_engineer')
        expect(sample_1.vacancy).to eq(5)
        expect(sample_1.job_description).to eq('work in rails')
        expect(sample_1.responsibilities).to eq('development')
        expect(sample_1.employment_status).to eq('full_time')
        expect(sample_1.edu_requirement).to eq('bsc in cse')
        expect(sample_1.exp_requirement).to eq(1)
        expect(sample_1.location).to eq('dhaka')
        expect(sample_1.remuneration).to eq(40000)
        expect(sample_1.benefits).to eq('yearly_bonus')
        expect(sample_1.date_issue).to eq('2018-11-08'.to_date)
        expect(sample_1.deadline).to eq('2018-12-08'.to_date)
        expect(sample_1.job_status).to eq('Open')
      end

      it 'redirects to the updated jobs#index' do
        patch :update, params: { id: sample_1, job: valid_attributes }
        expect(response).to redirect_to jobs_path
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        attributes_for(:job,
                       title: nil,
                       vacancy: 5,
                       job_description: 'work in rails',
                       responsibilities: 'development',
                       employment_status: 'full_time',
                       edu_requirement: 'bsc in cse',
                       exp_requirement: 1,
                       location: 'dhaka',
                       remuneration: 40000,
                       benefits: 'yearly bonus',
                       date_issue: '2018-11-08'.to_date,
                       deadline: '2018-12-08'.to_date,
                       job_status: 'Open')
      end

      it 'does not update the new job' do
        patch :update, params: { id: sample_1, job: invalid_attributes }
        sample_1.reload
        expect(sample_1.title).to eq('junior_software_engineer')
        expect(sample_1.vacancy).to eq(5)
        expect(sample_1.job_description).to eq('work with rails')
        expect(sample_1.responsibilities).to eq('development')
        expect(sample_1.employment_status).to eq('full_time')
        expect(sample_1.edu_requirement).to eq('bsc in cse')
        expect(sample_1.exp_requirement).to eq(1)
        expect(sample_1.location).to eq('dhaka')
        expect(sample_1.remuneration).to eq(40000)
        expect(sample_1.benefits).to eq('yearly_bonus')
        expect(sample_1.date_issue).to eq('2018-11-08'.to_date)
        expect(sample_1.deadline).to eq('2018-12-08'.to_date)
        expect(sample_1.job_status).to eq('Open')
      end

      it 're-renders the :edit template' do
        patch :update, params: { id: sample_1, job: invalid_attributes }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the job' do
      expect{ delete :destroy, params: { id: sample_1 }}.to change(Job, :count).by(-1)
    end

    it 'redirects to jobs#index' do
      delete :destroy, params: { id: sample_1 }
      expect(response).to redirect_to jobs_path
    end
  end
end
