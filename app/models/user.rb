class User < ApplicationRecord
  include Clearance::User
  before_validation :generate_confirmation_token, on: %i(create)
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
            message: I18n.t('shared.all.inv_email')}

  def forgot_password!
    generate_confirmation_token
    save validate: false
  end

  def confirm_email
    self.email_confirmed_at = Time.current
  end

  private

  def generate_confirmation_token
    self.confirmation_token = Clearance::Token.new
  end
end
