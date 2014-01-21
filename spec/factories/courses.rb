# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    sequence(:name){|n| "Course#{n}"}
    grade {rand(1..5)}
    department
    introduction "Introduction Text"
    aim "Aim Text"
  end
end
