FactoryBot.define do
  factory :job do
    title { 'junior_software_engineer' }
    vacancy { 2 }
    job_description { 'work work' }
    responsibilities { 'nothing'  }
    employment_status { 'full_time' }
    edu_requirement { 'bsc in cse' }
    exp_requirement { 5 }
    location { 'dhaka' }
    remuneration { 00000 }
    benefits { 'no additional benefits' }
    date_issue { '2018-10-25' }
    deadline { '2018-10-25' }
    job_status { 'MyString' }
    employer_notice { 'apply as quickly as possible' }
  end
end
