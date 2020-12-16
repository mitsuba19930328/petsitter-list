require 'rails_helper'

RSpec.describe 'セッション機能', type: :system do

  context '未ログインユーザーがアクションをした際' do
    it 'show' do
      # こういうのってcontrollerテストに書くべきなのかな？
    end

    it 'edit' do

    end

    it 'update' do

    end

    it 'destroy' do

    end
    # テストしたいこと
    # new,create以外のユーザーアクションを実行しようとすると、ログインメニューが出現すること
    # かつメッセージ（ログインしてください）も出現すること

  end

  context 'ログイン中ユーザー' do
    # before ログイン
    # テストしたいこと：他の人のアクションに行った際の挙動
    # ・ログイン中ユーザーが自分以外のユーザーのアクションページに行くと、エラーが出て別ページに飛ばされること
    # ・ログインしているユーザーがusers_showにいくと、showページが表示されること
    # ・ログインしているユーザーが自分以外のshowページに行くと、見れないこと（現在未実装：今は見れてしまう）
    # ・ログインしているユーザーが自分以外のupdateをしようとすると、エラーが出てできないこと
    # ・ログインしているユーザーが自分以外のdeleteをしようとすると、エラーが出てできないこと
  end

end