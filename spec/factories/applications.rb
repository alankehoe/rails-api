# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :application, class: Doorkeeper::Application do
    name { Faker::Company.name }
    redirect_uri 'urn:ietf:wg:oauth:2.0:oob'
  end
end
