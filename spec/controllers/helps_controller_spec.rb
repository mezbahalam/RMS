require 'rails_helper'
RSpec.describe HelpsController, type: :controller do

  let!(:user) do
    FactoryBot.create(:user, role: :applicant)
  end

  before do
    sign_in_as user
  end

  describe 'Get #show' do

    it 'renders the applicants to show' do
      get :show
      expect(response).to render_template :show
    end
  end
end
