
crumb :root do
  link "ペットシッターリスト", root_path
end

  crumb :petsitters do |petsitter|
    link "全てのペットシッター", petsitters_path
    parent :root
  end

    crumb :petsitter do |petsitter|
      petsitter = Petsitter.find(params[:id])
      link petsitter.name, petsitter_path(petsitter.id)
      parent :petsitters
    end

  crumb :user do |user|
    user = User.find(params[:id])
    link "#{user.name}さん のマイページ", user_path(user.id)
    parent :root
  end

    crumb :user_edit do |user|
      user = current_user
      link "ユーザ情報編集", edit_user_path(user.id)
      parent :user
    end

    crumb :user_histories do |user|
      user = User.find(params[:id])
      link "行ったお店一覧", user_histories_path(user.id)
      parent :user
    end

    crumb :user_clips do |user|
      user = User.find(params[:id])
      link "保存済み一覧", user_clips_path(user.id)
      parent :user
    end

