RSpec.describe UserMailer, type: :mailer do
  let(:user) { FactoryBot.create :user }

  describe 'notify' do
    let(:mail) { UserMailer.sign_up_confirmation(user) }

    it 'renders the subject' do
      expect(mail.subject).to eq('Confirm your Email')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq(['user13@example.com'])
    end
  end
end
