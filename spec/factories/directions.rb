FactoryGirl.define do
  factory :direction do
    step {Faker::Lorem.words(15)}
    position 1
    association :recipe 
  end
end
