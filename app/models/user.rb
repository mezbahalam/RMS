class User < ApplicationRecord
  include Clearance::User
  has_one :candidate, dependent: :destroy
  accepts_nested_attributes_for :candidate

  before_validation :generate_confirmation_token, on: %i(create)
  enum role: {admin: 0, candidate: 1}.freeze

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
  validates :first_name, :last_name, presence: true
  validates :role, presence: true

  def profile_filled?
    self.country?
  end

  def forgot_password!
    generate_confirmation_token
    save validate: false
  end

  def set_confirm_email
    self.email_confirmed_at = Time.current
  end

  private

  def generate_confirmation_token
    self.confirmation_token = Clearance::Token.new
  end
end
