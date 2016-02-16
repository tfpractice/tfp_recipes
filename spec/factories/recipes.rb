require 'faker'

FactoryGirl.define do
  factory :recipe do
    title {Faker::Lorem.words(3)}
    description {Faker::Lorem.words(40)}
    association :user
  end
end
