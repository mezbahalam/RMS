require 'rails_helper'

RSpec.describe Jobs::CalendarsController, type: :controller do
  let!(:user_1) { FactoryBot.create(:user, role: :admin) }
  let!(:user_2) { FactoryBot.create(:user, role: :applicant) }
  let!(:job_1) { FactoryBot.create(:job) }
  let!(:candidate_1) { FactoryBot.create(:candidate, user_id: user_2.id) }
  let!(:can_job) { FactoryBot.create(:candidate_job, candidate_id: candidate_1.id, job_id: job_1.id) }

  context 'User is admin' do
    describe 'GET #show as admin user' do
      before do
        sign_in_as user_1
        get :show
      end

      let!(:job_2) do
        FactoryBot.create(:job, title: 'junior_software_engineer')
      end

      it 'populates an array of all jobs' do
        expect(assigns(:calendars)).to match_array [job_1, job_2]
      end

      it 'renders show page' do
        expect(response).to render_template :show
      end
    end
  end
  context 'User is applicant' do
    describe 'GET #show as applicant' do
      before do
        sign_in_as user_2
        get :show
      end

      it 'populates an array of all the job applied by the candidate' do
        expect(assigns(:calendars)).to match_array [can_job]
      end

      it 'renders show page' do
        expect(response).to render_template :show
      end

    end
  end
end
