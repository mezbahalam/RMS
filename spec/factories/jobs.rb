FactoryBot.define do
  factory :job do
    title { 'junior_software_engineer' }
    description { 'software development on rails' }
    deadline { '2018-10-25'.to_date }
  end
end
