# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "user#{n}@example.com"}
    sequence(:name){|n| "User#{n}"}
    grade {rand(1..5)}
    department
    password "password"
    password_confirmation "password"
  end
end
