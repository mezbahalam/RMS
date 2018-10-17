class User < ApplicationRecord
  include Clearance::User
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
            message: I18n.t('shared.all.inv_email')}
end
