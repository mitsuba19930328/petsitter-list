



Petsitter.create(name: "Tokyo Sitter麻布本店",url: "https://tokyositter.com/shop/azabu/",email: "",address: "東京都港区麻布十番一丁目8番11号 3階",prefecture: "東京都", town: "港区",block: "麻布十番一丁目8番11号",apartment: "3階",area: "六本木、麻布十番、白金高輪",phone: "03-4361-1701", business_hours: "AM9:00～PM21:00", regular_holiday: "年中無休",pet_type: "犬、猫、うさぎ、他小動物", overview:"大切な家族を預けるならTokyo Sitter
高いホスピタリティと豊富な経験を積んだプロフェッショナル集団。
スタッフ全員が獣医師入交眞巳による講義を受け、獣医行動学に基づいたワンランク上のシッティングを行います。",qualification: "有資格者多数", registration_number: "保管 20東京都保第006853号", insurance:true, image: File.open("./public/uploads/seeds/tokyositter.jpg"))

# #
Petsitter.create(name: "ニャンコシッター",url: '',email: "sitter1@example.com",address: "東京都府中市黒木町黒木273-13",
                 prefecture: "東京都", town: "府中市",block: "黒木町黒木273-13",apartment: "",area: "府中市、調布市、国分寺",
                 phone: "080-0001-0001", business_hours: "08:00~18:30", regular_holiday: "水曜日",
                 pet_type: "犬、猫、うさぎ、他小動物", overview:"犬猫ウサギなんでも得意なペットシッターです。明るく元気に営業中！",
                 qualification: "認定ペットシッター", registration_number: "000001", insurance: true, image: File.open("./public/uploads/seeds/img1.jpg"))

Petsitter.create(name: "日向香織",url: '',email: "sitter2@example.com",address: "東京都六本木伏見区丹後町706-11",
                 prefecture: "東京都", town: "六本木", block: "伏見区丹後町706-11", apartment: "", area: "六本木",
                 phone: "080-0002-0002", business_hours: "09:00~19:00", regular_holiday: "月曜日、金曜日",
                 pet_type: "犬、猫", overview:"犬猫ウサギなんでも得意なペットシッターです。明るく元気に営業中！",
                 qualification: "認定ペットシッター", registration_number: "000002", insurance: true, image: File.open("./public/uploads/seeds/img2.jpg"))

Petsitter.create(name: "いつでもどこでも",url:'',email: "sitter3@example.com",address: "東京都新宿区南烏山3-138-12",
                 prefecture: "東京都", town: "新宿区", block: "南烏山3-138-12", apartment: "世田谷ライオンズマンション201号室", area: "世田谷区,白金,南青山",
                 phone: "080-0003-0003", business_hours: "10:00~20:00", regular_holiday: "火曜日",
                 pet_type: "犬、猫、うさぎ、他小動物", overview:"犬猫ウサギなんでも得意なペットシッターです。明るく元気に営業中！",
                 qualification: "ペットシッター士", registration_number: "000003", insurance: true, image: File.open("./public/uploads/seeds/img3.jpg"))

Petsitter.create(name: "愛知秀夫",url:'',email: "sitter4@example.com",address: "東京都吉祥寺狭山748-8",
                 prefecture: "東京都", town: "吉祥寺", block: "狭山748-8", apartment: "狭山マンション021号室", area: "吉祥寺",
                 phone: "080-0004-0004", business_hours: "09:30~19:30", regular_holiday: "金曜日",
                 pet_type: "猫、うさぎ", overview:"犬猫ウサギなんでも得意なペットシッターです。明るく元気に営業中！",
                 qualification: "認定ペットシッター", registration_number: "000004", insurance: true, image: File.open("./public/uploads/seeds/img4.jpg"))

Petsitter.create(name: "御相模ゆうき",url:'',email: "sitter5@example.com",address: "東京都原宿城見町828-2",
                 prefecture: "東京都", town: "原宿", block: "城見町828-2", apartment: "トヨタアパート101号室", area: "原宿",
                 phone: "080-0005-0005", business_hours: "08:30~18:30", regular_holiday: "木曜日",
                 pet_type: "犬、猫、うさぎ", overview:"犬猫ウサギなんでも得意なペットシッターです。明るく元気に営業中！",
                 qualification: "ペットシッター士", registration_number: "000005", insurance: true, image: File.open("./public/uploads/seeds/img5.png"))
#
#
10.times do |i|
  User.create(name: "テストユーザー#{i+1}", email: "user#{i+1}@example.com",password: "password", password_confirmation: "password", image: File.open("./public/uploads/seeds/bird-thumbnail.jpg"))
end
#
# 25.times do |i|
#   Petsitter.create(name: "ワンニャンシッター #{i+5}",url:'',email: "sitter#{i*5}@example.com",address: "東京都稲城市東長沼771-1",
#                    prefecture: "東京都", town: "稲城市", block: "東長沼771-1", apartment: "", area: "稲城市,多摩市",
#                    phone: "080-000#{i*5}-000#{i*5}", business_hours: "10:00~19:30", regular_holiday: "月曜日",
#                    pet_type: "犬、猫", overview:"犬猫ウサギ可愛いよね！序盤中盤終盤隙なく営業中です",
#                    qualification: "認定ペットシッター", registration_number: "00000#{i*5}", insurance: true, image: File.open("./public/uploads/seeds/default.jpg"))
# end