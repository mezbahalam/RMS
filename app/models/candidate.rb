class Candidate < ApplicationRecord
  has_one_attached :avatar
  belongs_to :user
  has_many :candidate_jobs
  has_many :jobs, through: :candidate_jobs
  paginates_per 10

  enum gender: { male: 0, female: 1 }
  scope :sorted_by_experience, -> { order('experience ASC') }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :cgpa, :passing_year, presence: true
  validates :skill, :personal_interest, presence: true
  validates :experience, presence: true, numericality: true
  validates :contact, numericality: true
  validates :user_id, presence: true, uniqueness: true
  validates :dob, presence: true

  before_validation { avatar.delete if @delete_avatar }

  def delete_avatar
    @delete_avatar ||= false
  end

  def delete_avatar=(value)
    @delete_avatar  = value.to_i.nonzero?
  end
end
