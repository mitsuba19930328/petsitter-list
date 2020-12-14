FactoryBot.define do
  factory :user do
    name {"Diana"}
    sequence(:email) { |n| "diana#{n}@example.com"}
    password {"password"}
    image_name {"image_diana"}
  end

  factory :other_user do
    name {"Lapan"}
    sequence(:email) { |n| "lapan#{n}@example.com"}
    password {"password"}
    image_name {"image_lapan"}
  end
end
