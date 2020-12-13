FactoryBot.define do
  factory :user do
    name {"Diana"}
    sequence(:email) { |n| "diana#{n}@example.com"}
    password {"password"}
    image_name {"image_diana"}
  end
end
