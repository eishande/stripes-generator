require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :dataset do
    data [45, 32, 57, 40, 23]
    user
  end

  factory :pattern do
    colors %w(#5C323E #A82743 #E15E32 #C0D23E #E5F04C)
    dataset
    user
  end
end
