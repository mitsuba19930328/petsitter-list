require 'rails_helper'

RSpec.describe User, type: :model do

  context '新規登録' do

    it "名前とメールアドレスとパスワードがあれば登録できる" do
      expect(FactoryBot.create(:user)).to be_valid
    end

    it "名前がなければ登録できない" do
      expect(FactoryBot.build(:user, name:'')).to_not be_valid
    end

    it "名前なしの登録時に適切なエラーメッセージが返却されること" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "名前が重複していても登録できる" do
      user1 = FactoryBot.create(:user, name: 'hogehoge')
      expect(FactoryBot.build(:user, name: user1.name)).to be_valid
    end

    it "メールアドレスがなければ登録できない" do
      expect(FactoryBot.build(:user, email: '')).to_not be_valid
    end

    it "メールアドレスなしの登録時に適切なエラーメッセージが返却されること" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "メールアドレスが重複していたら登録できない" do
      user1 = FactoryBot.create(:user, email: 'copy@example.com')
      expect(FactoryBot.build(:user, email: user1.email)).to_not be_valid
    end

    it "パスワードがなければ登録できない" do
      expect(FactoryBot.build(:user, password: '')).to_not be_valid
    end

    it "メールアドレスなしの登録時に適切なエラーメッセージが返却されること" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワードが暗号化されているか" do
      user = FactoryBot.create(:user)
      expect(user.password_digest).to_not eq "password"
    end

    it "passwordとpassword_confirmationの値が異なる場合は登録できない" do
      expect(FactoryBot.build(:user, password: 'password', password_confirmation: 'passward')).to_not be_valid
    end

    it "image_nameがなくても登録できる" do
      expect(FactoryBot.build(:user, image: '')).to be_valid
    end

    it "passwordが5文字以下の場合登録が失敗する事" do
      expect(FactoryBot.build(:user, password: '12345', password_confirmation: '12345')).to_not be_valid
    end

  end

  context '編集' do

    # it "パスワードがなければ更新できない" do
    #   user = FactoryBot.create(:user)
    #   expect(user.password_digest).to_not eq "password"
    #
    #   # expect(FactoryBot.update(:user, name:'testman')).to_not be_valid
    # end
    #
    # it "名前がなければ更新できない" do
    #   expect(FactoryBot.update(:user, name:'', password:'password')).to_not be_valid
    # end


  end

end
