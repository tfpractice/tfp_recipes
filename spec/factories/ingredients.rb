require 'faker'

FactoryGirl.define do
  factory :ingredient do
    name {Faker::Lorem.word}
    quantity {Faker::Number.between(1, 10)}
    association :recipe
  end
end
