FactoryBot.define do
  factory :user do
    name {"Diana"}
    sequence(:email) { |n| "diana#{n}@example.com"}
    password {"password"}
  end
end
