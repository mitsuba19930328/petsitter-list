require 'rails_helper'

RSpec.describe 'User', type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'User新規登録' do
    describe 'ログイン前' do
      describe 'ユーザー新規登録' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの新規登録が成功' do

            # ユーザー新規登録画面へ移動
            visit new_user_path

            # 諸オブジェクトを入れていく
            # nameテキストフィールドに'Watage'を入力
            fill_in 'user_name', with: 'Watage'

            # emailテキストフィールドに'watage@example.com'を入力
            fill_in 'user_email', with: 'watage@example.com'

            # passwordテキストフィールドに'password'を入力
            fill_in 'user_password', with: 'password'

            # password_confirmationテキストフィールドに'password'を入力
            fill_in 'user_password_confirmation', with: 'password'

            # image_nameテキストフィールドに'watage_image'を入力
            fill_in 'user_image_name', with: 'watage_image'

            # submitと記述のあるsubmitをクリックする
            click_button 'submit_btn'

            # root_pathへ遷移することを期待する
            expect(current_path).to eq login_path

            # 遷移されたページに'ユーザー登録が完了しました。'の文字列があることを期待する
            expect(page).to have_content 'ユーザー登録が完了しました。'

          end

        end
        context 'メールアドレス未記入' do

        end
        context '登録済メールアドレス' do

        end
      end

    end

  end

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