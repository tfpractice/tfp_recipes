require 'faker'

FactoryGirl.define do
  factory :ingredient do
    name {Faker::Lorem.word}
    quantity {Faker::Number.between(1, 10)}
    quantity_unit 'cup'
    association :recipe
  end
end
