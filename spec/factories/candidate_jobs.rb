FactoryBot.define do
  factory :candidate_job do
    association :candidate
    association :job

    candidate_id { '31' }
    job_id { '5' }
    expected_salary { '20000' }

  end
end
