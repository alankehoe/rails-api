# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password 'pa55word'
    password_confirmation 'pa55word'
    admin false
    name { Faker::Company.name }
    skype { Faker::Company.name }
    twitter { Faker::Company.name }
    facebook { Faker::Company.name }
    linkedin { Faker::Company.name }
    current_sign_in_at Time.now
    last_sign_in_at Time.now
  end
end
