# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle do
    make { Faker::Commerce.product_name }
    model { Faker::Commerce.product_name }
    first_registered Time.now
    fuel_type %w(diesel petrol lpg).sample
    gearbox_type %w(automatic manual).sample
    body_type %w(hatchback saloon suv).sample
    description 'greatest car ever'
    odometer 100_000
    odometer_unit %w(miles kilometers).sample
    fuel_efficiency 1.5
    fuel_efficiency_unit %w(l/100km km/l mpg).sample
  end
end
