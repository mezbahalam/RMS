FactoryGirl.define do
  factory :candidate do
    name 'Laila'
    gender 'Female'
    dob '17 Aug 1994'
    contact '01792050217'
    address 'house 48, road 4, bashundhara'
    skill 'c++,c,ruby'
    experience '2'
    personal_interest 'shopping'
    hobbies 'travelling'
    long_term_plan 'CEO'
    keywords 'software'
    referrals 'Tanzim'
    email {Faker::Internet.email}
  end
end
