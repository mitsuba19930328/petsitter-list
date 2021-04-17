require 'rails_helper'

RSpec.describe Petsitter, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context '新規登録' do

    it "必要な情報が揃っていれば登録できる" do
      expect(FactoryBot.create(:petsitter)).to be_valid
    end

    it "名前がなければ登録できない" do
      expect(FactoryBot.build(:petsitter, name:'')).to_not be_valid
    end

    it "名前が重複していても登録できる" do
      petsitter1 = FactoryBot.create(:petsitter, name: 'hogehoge')
      expect(FactoryBot.build(:user, name: petsitter1.name)).to be_valid
    end

    it "都道府県がなければ登録できない" do
      expect(FactoryBot.build(:petsitter, prefecture:'')).to_not be_valid
    end

    it "市区町村がなければ登録できない" do
      expect(FactoryBot.build(:petsitter, town:'')).to_not be_valid
    end

    it "電話番号がなければ登録できない" do
      expect(FactoryBot.build(:petsitter, phone:'')).to_not be_valid
    end

    it "電話番号が正規表現チェックに沿っていなければ登録できない" do
      expect(FactoryBot.build(:petsitter, phone:'090--000-0000')).to_not be_valid
    end

    it "電話番号がハイフンなしでも登録できる" do
      expect(FactoryBot.build(:petsitter, phone:'09012341234')).to be_valid
    end

    it "対応可能ペットの種類がなければ登録できない" do
      expect(FactoryBot.build(:petsitter, pet_type:'')).to_not be_valid
    end

    it "保険の有無がなければ登録できない" do
      expect(FactoryBot.build(:petsitter, insurance:nil)).to_not be_valid
    end



    # t.string "name", null: false
    # t.string "address", null: false
    # t.string "prefecture", null: false
    # t.string "town", null: false
    # t.string "phone", null: false
    # t.string "business_hours"
    # t.string "regular_holiday"
    # t.string "pet_type", null: false
    # t.string "qualification"
    # t.string "registration_number"
    # t.boolean "insurance", default: false, null: false
    # t.datetime "created_at", precision: 6, null: false
    # t.datetime "updated_at", precision: 6, null: false
    # t.string "image"
    # t.string "apartment"
    # t.string "block"
    # t.string "overview"
    # t.string "area"
    # t.string "url"

  end
end
