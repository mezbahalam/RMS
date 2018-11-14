FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email
    password { 'password' }
    first_name { 'Laila' }
    middle_name { 'Nushrat' }
    last_name { 'Raha' }
    contact { '01792052217' }
    address { 'house 48, block E, bashundhara' }
    dob { '17-08-1994' }
    country { 'BD' }
    email_confirmed_at { Time.now }
  end
end
