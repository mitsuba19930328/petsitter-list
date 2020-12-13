require 'rails_helper'

RSpec.describe 'ユーザー登録機能', type: :system do

  context '新規登録' do

    # 基本的な登録のテストに関しては、models/users_spec.rbに記載済み
    # ここではエラーメッセージが出るかや、登録後の遷移がされているかなどを確認する。
    # TODO 登録後、sessionに新規登録した人のidを入れるべきだと思うけど、未実装なんで対応する必要

    it '新規登録に成功した場合、画面がトップページに遷移して、登録成功のメッセージが出現すること' do
      #　新規登録を行う（成功パターン）
      # トップページにいることが期待される
      # 登録成功の旨が出現することが期待される
      # sessionに保存済みになっていることが期待される
    end

    it '新規登録に失敗した場合、画面が新規登録画面のままで、登録失敗のメッセージが出現すること' do
      #　新規登録を行う（失敗パターン）
      # 新規登録画面のままであることが期待される
      # 登録失敗の旨が出現することが期待される
      # フォームにはさっきの失敗した入力値が入っていることが期待される
    end

    # before do
    #   @user = User.create!(name: 'いとう')
    # end

  end


  context '更新後の動き' do
    before do
      # ログインすること
    end

    # it "名前とメールアドレスがあり、パスワードが合っていれば更新できる" do
    #   expect(FactoryBot.update(:user, name: 'Lapan', email: 'lapan@example.com', password: 'password', password_confirmation: 'password')).to be_valid
    # end


  end





end