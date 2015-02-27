# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
  end
end
