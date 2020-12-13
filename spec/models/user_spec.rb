require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context '新規登録' do

    it "名前とメールアドレスとパスワードがあれば登録できる" do
      expect(FactoryBot.create(:user)).to be_valid
    end

    it "名前がなければ登録できない" do
      expect(FactoryBot.build(:user, name:'')).to_not be_valid
    end

    it "メールアドレスがなければ登録できない" do
      expect(FactoryBot.build(:user, email: '')).to_not be_valid
    end

    it "メールアドレスが重複していたら登録できない" do
      user1 = FactoryBot.create(:user, email: 'copy@example.com')
      expect(FactoryBot.build(:user, email: user1.email)).to_not be_valid
    end

    it "パスワードがなければ登録できない" do
      expect(FactoryBot.build(:user, password: '')).to_not be_valid
    end

    it "パスワードが暗号化されているか" do
      user = FactoryBot.create(:user)
      expect(user.password_digest).to_not eq "password"
    end

    it "passwordとpassword_confirmationの値が異なる場合は登録できない" do
      expect(FactoryBot.build(:user, password: 'password', password_confirmation: 'passward')).to_not be_valid
    end

    it "image_nameがなくても登録できる" do
      expect(FactoryBot.build(:user, image_name: '')).to be_valid
    end

    # TODO パスワードが8文字以下の場合登録が失敗する事（未実装）

  end
end
