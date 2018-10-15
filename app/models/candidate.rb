class Candidate < ApplicationRecord
  has_one_attached :avatar
  Gender = %w[Male Female]
  scope :sorted, lambda {order('experience ASC')}
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :skill,:personal_interest, presence: true
  validates :experience, presence: true, numericality: true
  validates :contact, numericality: true

  before_validation { avatar.delete if @delete_avatar }

  def delete_avatar
    @delete_avatar ||= false
  end

  def delete_avatar=(value)
    @delete_avatar  = !value.to_i.zero?
  end
end
