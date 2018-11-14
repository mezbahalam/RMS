class Job < ApplicationRecord
  enum title: {junior_software_engineer: 0, software_engineer: 1, senior_software_engineer: 2, project_manager: 3, managing_director: 4}
  enum employment_status: {full_time: 0, part_time: 1, contractual: 2}
  enum location: {dhaka: 0, switzerland: 1, south_africa: 2}
  scope :sorted, lambda { order('vacancy ASC') }
  validates :title, presence: true
  validates :job_description, presence: true
  validates :employment_status, presence: true
  validates :exp_requirement, presence: true, numericality: true
  validates :remuneration, presence: true, numericality: true
  validates :job_status, presence: true
end
