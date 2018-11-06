class Job < ApplicationRecord

  DESIGNATIONS = ["Junior Software Engineer",
      "Software Engineer",
      "Senior Software Engineer",
      "Project Manager"
  ]

  VACANCIES = ["Undefined",
               "1",
               "2",
               "3",
               "4",
               "5"
  ]

  EMP_STATUS = ["Full-time",
                "Part-time",
                "Contractual"
  ]

  LOCATIONS = [

      "Dhaka",
      "Switzerland",
      "South Africa"
  ]

  STATUS = [

      " Open",
      " Closed"
  ]

  validates :title, presence: true
  validates :job_description, presence: true
  validates :employment_status, presence: true
  validates :exp_requirement, presence: true, numericality: true
  validates :remuneration, presence: true, numericality: true
  validates :job_status, presence: true
end