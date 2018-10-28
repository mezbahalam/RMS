FactoryBot.define do
  factory :job do
    title { "MyString" }
    job_description { "MyText" }
    responsibilities { "MyText" }
    requirements { "MyText" }
    remuneration { "MyText" }
    location { "MyText" }
    deadline { "2018-10-25" }
    date_issue { "2018-10-25" }
    status { "MyString" }
  end
end
