

# Petsitter.create()
#

10.times do |i|
  User.create(name: "テストユーザー#{i+1}", email: "user#{i+1}@example.com",password: "password", password_confirmation: "password", image: "default.jpg")
end

25.times do |i|
  Petsitter.create(name: "ワンニャンシッター #{i+1}",email: "sitter#{i*1}@example.com",address: "福岡県八女市黒木町黒木273-13", prefecture: "福岡県", town: "八女市黒木町黒木273-13",
                   phone: "080-000#{i}-000#{i}", business_hours: "10:00~19:30", regular_holiday: "月曜日", pet_type: "犬、猫",
                   qualification: "認定ペットシッター", registration_number: "00000#{i}", insurance: true, image: "IMG_2346.JPG")
end