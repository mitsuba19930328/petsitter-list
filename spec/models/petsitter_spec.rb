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
      expect(FactoryBot.build(:user, name: user1.name)).to be_valid
    end

  end
end
