require 'ffaker'
FactoryBot.define do
  factory :candidate do
    association :user, factory: :user

    name { 'Nushrat Raha' }
    gender { :female }
    dob { '1991-07-01'.to_date }
    email { FFaker::Internet.email }
    contact { '017920517' }
    address { 'house 48, road 8, bashundhara' }
    university_name { 'Dhaka University' }
    major { 'Computer Science and Engineering' }
    minor { 'Computational Mathematics' }
    cgpa { '3.89' }
    passing_year { '2017' }
    skill { 'c++,c,ruby' }
    experience { 2.5 }
    personal_interest { 'shopping' }
    hobbies { 'travelling' }
    long_term_plan { 'CEO' }
    keywords { 'software' }
    referrals { 'Tanzim' }
  end
end
