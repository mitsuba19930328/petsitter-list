require 'rails_helper'

RSpec.describe 'User', type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'User登録、編集' do
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
          # fill_in 'user_image_name', with: 'watage_image'
          # submitと記述のあるsubmitをクリックする
          click_button 'submit_btn'

          # 新規登録後のテスト
          # root_pathへ遷移することを期待する
          expect(current_path).to eq root_path

          # 遷移されたページに'ユーザー登録が完了しました。'の文字列があることを期待する
          expect(page).to have_content 'ユーザー登録が完了しました。'

        end

      end
      context 'フォームの入力値が不正' do

        # 細かなフォーム入力値チェックはmodel/user_specにて確認するため、ここでは失敗時アクションを主に確認

        it 'ユーザーの新規登録が失敗（複数要因）' do
          # ユーザー新規登録画面へ移動
          visit new_user_path

          # エラーが起こる新規登録処理を行う（エラー後の挙動を確認したいから）
          # nameテキストフィールドには今回は何も入れません
          fill_in 'user_name', with: ' '
          # emailテキストフィールドには今回は何も入れません
          fill_in 'user_email', with: 'test@example.com'
          # passwordテキストフィールドには今回は何も入れません
          fill_in 'user_password', with: ' '
          # password_confirmationテキストフィールドに'password'を入力
          fill_in 'user_password_confirmation', with: 'password'
          # image_nameテキストフィールドに'watage_image'を入力
          # fill_in 'user_image_name', with: 'watage_image'
          # submitボタンをクリック
          click_button 'submit_btn'

          # 新規登録失敗時のテスト
          # new_user_pathへ遷移することを期待する
          expect(current_path).to eq "/users"

          # 以下、失敗時のメッセージ確認
          # 新規登録ページに'ユーザー登録が完了しました。'の文字列があることを期待する
          expect(page).to have_content 'ユーザー登録が失敗しました。'

          # 新規登録ページのエラー原因が書かれていることを期待する
          expect(page).to have_content '名称を入力してください'
          expect(page).to have_content 'パスワードを入力してください'
          expect(page).to have_content 'パスワードは6文字以上で入力してください'

        end

        it 'ユーザーの新規登録が失敗（複数要因ver2）' do
          # ユーザー新規登録画面へ移動
          visit new_user_path

          # エラーが起こる新規登録処理を行う（エラー後の挙動を確認したいから）
          # nameテキストフィールドには'Watage'を入れます
          fill_in 'user_name', with: 'Watage'
          # emailテキストフィールドには'watage@example.com'を入れます
          fill_in 'user_email', with: 'watage@example.com'
          # passwordテキストフィールドには'password'
          fill_in 'user_password', with: 'password'
          # password_confirmationテキストフィールドに'passward'を入力
          fill_in 'user_password_confirmation', with: 'passward'
          # image_nameテキストフィールドには何も入れません
          # fill_in 'user_image_name', with: ''
          # submitボタンをクリック
          click_button 'submit_btn'

          # 新規登録失敗時のテスト
          # users_pathへ遷移することを期待する
          expect(current_path).to eq users_path

          # 以下、失敗時のメッセージ確認
          # 新規登録ページに'ユーザー登録が完了しました。'の文字列があることを期待する
          expect(page).to have_content 'ユーザー登録が失敗しました。'

          # 新規登録ページのエラー原因が書かれていることを期待する
          expect(page).to have_content 'パスワード（確認）とパスワードの入力が一致しません'

          # 新規失敗時、パスワード系以外はそのままフォームに値が入っていること
          # expect(page).to have_content 'Watage'
          # expect(page).to have_content 'watage@example.com'

        end
    end
  end

    describe 'ユーザー更新' do

      # TODO 現在対応中
      before 'ログイン処理'do
        visit login_path
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: 'password'
        # submitボタンをクリック
        click_button 'submit_btn'
      end

      context 'フォームの入力値が正常' do
        it 'ユーザーの更新が成功' do

          # ユーザー編集画面へ移動
          visit edit_user_path(user)

          # 諸オブジェクトを入れていく
          # nameテキストフィールドに'Lapan'を入力
          fill_in 'user_name', with: 'Lapan'
          # emailテキストフィールドに'lapan@example.com'を入力
          fill_in 'user_email', with: 'lapan@example.com'
          # passwordテキストフィールドに'password'を入力
          fill_in 'user_password', with: 'password'
          # password_confirmationテキストフィールドに'password'を入力
          fill_in 'user_password_confirmation', with: 'password'
          # submitと記述のあるsubmitをクリックする
          click_button 'submit_btn'

          # 更新後のテスト
          # root_pathへ遷移することを期待する
          expect(current_path).to eq root_path

          # 遷移されたページに'ユーザー登録が完了しました。'の文字列があることを期待する
          expect(page).to have_content 'ユーザー情報を更新しました。'
        end
      end

      context 'フォームの入力値が不正' do

        # 細かなフォーム入力値チェックはmodel/user_specにて確認するため、ここでは失敗時アクションを主に確認

        it 'ユーザーの更新が失敗（複数要因）' do
          # ユーザー編集画面へ移動
          visit edit_user_path(user)

          # エラーが起こる新規登録処理を行う（エラー後の挙動を確認したいから）
          # nameテキストフィールドには今回は何も入れません
          fill_in 'user_name', with: ' '
          # emailテキストフィールドには今回は何も入れません
          fill_in 'user_email', with: 'test@example.com'
          # passwordテキストフィールドには今回は何も入れません
          fill_in 'user_password', with: ' '
          # password_confirmationテキストフィールドに'password'を入力
          fill_in 'user_password_confirmation', with: 'password'
          # submitボタンをクリック
          click_button 'submit_btn'

          # 以下、失敗時のメッセージ確認
          # 更新ページに'ユーザー情報更新に失敗しました。'の文字列があることを期待する
          expect(page).to have_content 'ユーザー情報更新に失敗しました。'

          # 更新ページのエラー原因が書かれていることを期待する
          expect(page).to have_content '名称を入力してください'
          expect(page).to have_content 'パスワードを入力してください'
          expect(page).to have_content 'パスワードは6文字以上で入力してください'

        end

        it 'ユーザーの更新が失敗（複数要因ver2）' do
          # ユーザー編集画面へ移動
          visit edit_user_path(user)

          # エラーが起こる新規登録処理を行う（エラー後の挙動を確認したいから）
          # nameテキストフィールドには'Watage'を入れます
          fill_in 'user_name', with: 'Watage'
          # emailテキストフィールドには'watage@example.com'を入れます
          fill_in 'user_email', with: 'watage@example.com'
          # passwordテキストフィールドには'password'
          fill_in 'user_password', with: 'password'
          # password_confirmationテキストフィールドに'passward'を入力
          fill_in 'user_password_confirmation', with: 'passward'
          # submitボタンをクリック
          click_button 'submit_btn'

          # 以下、失敗時のメッセージ確認
          # 更新ページに'ユーザー情報更新に失敗しました。'の文字列があることを期待する
          expect(page).to have_content 'ユーザー情報更新に失敗しました。'

          # 更新ページのエラー原因が書かれていることを期待する
          expect(page).to have_content 'パスワード（確認）とパスワードの入力が一致しません'

        end
      end
    end

    describe 'ユーザー削除' do
    end
  end
end