FactoryBot.define do
  factory :petsitter do

    name {"sample-petsitter"}
    # sequence(:email) { |n| "petsitter#{n}@example.com"}
    address {""}
    prefecture {"東京都"}
    town {"荒川区"}
    phone {"090-0000-0000"}
    business_hours {"10:00~19:00"}
    regular_holiday {"年中無休"}
    pet_type {"犬、猫、うさぎ"}
    qualification {"有資格者多数"}
    registration_number {"保管 20東京都保第000000号"}
    insurance {true}
    image {"tokyositter.jpg"}
    apartment {"3階"}
    block {"麻布十番一丁目1番1号"}
    overview {"明るく元気に営業中"}
    area {"六本木、麻布十番、白金高輪"}
    url {"https://sample.com"}
    
  end
end
