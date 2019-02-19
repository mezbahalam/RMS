require 'rails_helper'
RSpec.describe CandidateJobsController, type: :controller do
  let!(:user) { FactoryBot.create(:user, role: :applicant) }
  let!(:candidate_1) { FactoryBot.create(:candidate, user_id: user.id) }
  let!(:job_1) do
    FactoryBot.create(:job,
                      title: 'junior_software_engineer',
                      description: 'work with rails',
                      deadline: '2018-11-25'.to_date)
  end

  before do
    sign_in_as(user)
  end

  describe 'GET #index' do
    let!(:job_2) do
      FactoryBot.create(:job, title: 'junior_software_engineer')
    end

    it 'populates an array of all jobs' do
      get :index
      expect(assigns(:jobs)).to match_array [job_1, job_2]
    end
  end
  describe 'GET #new' do
    it 'assigns a new application to @application' do
      get :new, params: { candidate_id: candidate_1.id,
                          job_id: job_1.id }
      expect(assigns(:candidate_job)).to be_a_new(CandidateJob)
    end

    it 'renders the :new template' do
      get :new, params: { candidate_id: candidate_1.id,
                          job_id: job_1.id }
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let!(:user_1) { FactoryBot.create(:user, role: :applicant) }
    let!(:candidate_2) { FactoryBot.create(:candidate, user_id: user_1.id) }

    context 'with valid attributes' do
      let(:valid_attributes) do
        FactoryBot.attributes_for(:candidate_job,
                                  candidate_id: candidate_2.id,
                                  job_id: job_1.id,
                                  expected_salary: '50000')
      end

      it 'saves the new application in the database and gives a flash message' do
        expect do
          post :create,
            params: { candidate_job: valid_attributes,
                      candidate_id: candidate_2.id,
                      job_id: job_1.id }
        end.to change(CandidateJob, :count).by(1)
        expect(flash[:notice]).to eq('Job Applied')
      end

      it 'redirects to candidate_jobs#index' do
        post :create, params: { candidate_job: valid_attributes,
                                candidate_id: candidate_1.id,
                                job_id: job_1.id }
        expect(response).to redirect_to candidate_jobs_path
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        FactoryBot.attributes_for(:candidate_job,
                                  expected_salary: nil)
      end

      it 'does not save the new candidate in the database' do
        expect do
          post :create, params: { candidate_job: invalid_attributes,
                                  candidate_id: candidate_2.id,
                                  job_id: job_1.id }
        end.not_to change(CandidateJob, :count)
        expect(flash[:error]).to eq("Expected salary can't be blank and Expected salary is not a number")
      end

      it 'renders the new template' do
        post :create, params: { candidate_job: invalid_attributes,
                                candidate_id: candidate_1.id,
                                job_id: job_1.id }
        expect(response).to render_template :new
      end
    end
  end
end
