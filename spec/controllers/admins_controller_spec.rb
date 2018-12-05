require 'rails_helper'
RSpec.describe AdminsController, type: :controller do
  let!(:user) do
    FactoryBot.create(:user, role: :admin)
  end

  before do
    sign_in_as user
  end

  describe 'GET #index' do
    it 'renders the admin to the index' do
      get :index
      expect(response).to render_template :index
    end
  end
end
