FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email
    password  { 'password' }
    first_name { 'Munira' }
    middle_name { 'Nushrat' }
    last_name { 'Rahman' }
    country { 'BD' }
    email_confirmed_at { Time.now }
    role { 'candidate' }
  end
end
