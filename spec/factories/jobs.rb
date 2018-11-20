FactoryBot.define do
  factory :job do
    title { 'junior_software_engineer' }
    vacancy { 2 }
    job_description { 'development' }
    responsibilities { 'work in rails'  }
    employment_status { 'full_time' }
    edu_requirement { 'bsc in cse' }
    exp_requirement { 5 }
    location { 'dhaka' }
    remuneration { 40000 }
    benefits { 'yearly bonus' }
    date_issue { '2018-10-25' }
    deadline { '2018-10-25' }
    job_status { 'open' }
    employer_notice { 'send your resume to recruitment@welldev.io' }
  end
end
