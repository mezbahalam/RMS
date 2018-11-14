FactoryBot.define do
  factory :job do
    title { 'junior_software_engineer' }
    vacancy { 2 }
    job_description { 'Work on ruby on rails' }
    responsibilities { 'You will be responsible to develop application for clients'  }
    employment_status {'full_time'}
    edu_requirement { 'bsc in cse' }
    exp_requirement { 5 }
    location { 'dhaka' }
    remuneration { 00000 }
    benefits { 'yearly bonus' }
    date_issue { '2018-10-25' }
    deadline { '2018-10-25' }
    job_status { 'MyString' }
    employer_notice { 'send your cv to career@welldev.io' }
  end
end
