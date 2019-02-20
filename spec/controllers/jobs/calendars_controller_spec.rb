require 'rails_helper'

RSpec.describe Jobs::CalendarsController, type: :controller do
  let!(:first_user) { FactoryBot.create(:user, role: :admin) }
  let!(:second_user) { FactoryBot.create(:user, role: :applicant) }
  let!(:job_one) { FactoryBot.create(:job) }
  let!(:candidate_one) { FactoryBot.create(:candidate, user_id: second_user.id) }
  let!(:candidate_job_one) { FactoryBot.create(:candidate_job, candidate_id: candidate_one.id, job_id: job_one.id) }

  context 'User is admin' do
    describe 'GET #show as admin user' do
      before do
        sign_in_as first_user
      end

      let!(:job_two) do
        FactoryBot.create(:job, title: 'junior_software_engineer')
      end

      it 'populates an array of all jobs' do
        get :show
        expect(assigns(:calendars)).to match_array [job_one, job_two]
      end

      it 'renders show page' do
        get :show
        expect(response).to render_template :show
      end
    end
  end

  context 'User is applicant' do
    describe 'GET #show as applicant' do
      before do
        sign_in_as second_user
      end

      it 'populates an array of all the job applied by the candidate' do
        get :show
        expect(assigns(:calendars)).to match_array [candidate_job_one]
      end

      it 'renders show page' do
        get :show
        expect(response).to render_template :show
      end
    end
  end
end
